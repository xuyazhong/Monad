//
//  ViewController.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let a : Int? = 1
//        let b = a + 1
        
        let a1 : Int? = 3
        let b1 = a1.map { (e: Int) -> Int in
            return e * 2
        }
        debugPrint("b1: \(String(describing: b1))")
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        demo1()
        
        
        
        
        API().star(ok: { (model) in
            debugPrint("success: \(model)")
        }) { (err) in
            debugPrint("failure: \(err)")
        }
        
        
        
        
        
        Demo().test()
        
        
        
        
        
        
        
        
        
        
        
        
        let dict:[String: Any] = ["person": ["firstName": "yazhong","lastName": "xu"]]
        let normalPerson = NormalCreatePerson(json: dict)
        let mapPerson = MapCreatePerson(json: dict)
        
        debugPrint("normal Person :\(String(describing: normalPerson))")
        debugPrint("map Person : \(String(describing: mapPerson))")
        


        
    }
    
    func demo1() {
        
        let tq: Int? = 1
        let b = tq.map { (a: Int) -> Int? in
            if a % 2 == 0 {
                return a
            } else {
                return nil
            }
        }
        
        if let _ = b {
            print("not nil")
        }
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
//        return (json["person"] as? [String: Any]).flatMap(Person.init)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

