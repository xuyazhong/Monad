//
//  ViewController.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import UIKit
import RxAlamofire
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let sourceStringURL = "http://api.fixer.io/latest?base=EUR&symbols=USD"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Demo().test()
        
        let dict:[String: Any] = ["person": ["firstName": "yazhong","lastName": "xu"]]
        let normalPerson = NormalCreatePerson(json: dict)
        let mapPerson = MapCreatePerson(json: dict)
        
        debugPrint("normal Person :\(String(describing: normalPerson))")
        debugPrint("map Person : \(String(describing: mapPerson))")
        
        exampleUsages()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        RxAlamofire.requestJSON(.get, sourceStringURL)
            .debug()
            .subscribe(onNext: { [weak self] (r, json) in
                if let dict = json as? [String: AnyObject] {
                    let valDict = dict["rates"] as! Dictionary<String, AnyObject>
                    if let conversionRate = valDict["USD"] as? Float {
                        let result = formatter
                            .string(from: NSNumber(value: conversionRate * 10)) ?? "error"
                        debugPrint("success: \(String(describing: result))")
                    }
                }
                }, onError: { [weak self] (error) in
                    debugPrint("error: \(error)")
            })
            .addDisposableTo(disposeBag)
        
    
    }
    
    
    func demo2() {
        
        let tq: Int? = 1
        let b = tq.map { (a: Int) -> Int? in
            if a % 2 == 0 {
                return a
            } else {
                return nil
            }
        }
        
        let c : Int? = b!
        
        if let _ = c {
            debugPrint("not nil")
        } else {
            debugPrint("nil")
        }
    }
    
    func NormalCreatePerson(json: [String: Any]) -> Person? {
        if let personJson = json["person"] as? [String: Any] {
            return Person(json: personJson)
        }
        return nil
    }
    
    func MapCreatePerson(json: [String: Any]) -> Person? {
        return (json["person"] as? [String: Any]).map({ Person(json: $0) }) ?? nil
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func exampleUsages() {
        let stringURL = "http://alpha-api.fishtrip.cn/api/v1/houses/star"
        // MARK: Alamofire manager
        // same methods with with any alamofire manager
        
        let manager = SessionManager.default
        
        // NSURLHTTPResponse + JSON
        _ = manager.rx.responseJSON(.get, stringURL)
            .observeOn(MainScheduler.instance)
            .subscribe { print($0) }
        
        // NSURLHTTPResponse + Validation + NSURLHTTPResponse + String
        _ = manager.rx.request(.get, stringURL)
            .flatMap {
                $0
                    .validate(statusCode: 200 ..< 300)
                    .validate(contentType: ["text/json"])
                    .rx.responseString()
            }
            .observeOn(MainScheduler.instance)
            .subscribe { print($0) }

    }
    

}

