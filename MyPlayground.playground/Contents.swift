//: Playground - noun: a place where people can play
import UIKit




//let a : Int? = 1
//let b = a + 1



let a1 : Int? = 3
let b1 = a1.map { (e: Int) -> Int in
    return e * 2
}
debugPrint("b1: \(String(describing: b1))")



