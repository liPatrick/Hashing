//
//  ViewController.swift
//  Hashing
//
//  Created by Patrick Li on 6/27/17.
//  Copyright © 2017 Patrick Li. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var encryptMe = "l222"
        print(numeratorHash(input: encryptMe, output: ""))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numeratorHash(input: String, output: String) -> String{
        print("here")
        var out = output
        var inp = input
        var counter = 0
        var num = 1
        
        //generates one character
        while (counter < input.characters.count){
            if(counter+1 >= input.characters.count){
                var firstVal = combineTwoValues(val1: convertStringToNum(val: input[counter]), val2: 7)
                num = num + combineTwoValues(val1: firstVal, val2: num)
                break
            }
            var firstVal = combineTwoValues(val1: convertStringToNum(val: input[counter]), val2: convertStringToNum(val: input[counter+1]))
            num = num + combineTwoValues(val1: firstVal, val2: num)
            counter += 1
        }
        print(num % 10)
        out = output + String(num % 10)
        inp = input + output
        
        
        if (out.characters.count < 10){
            return numeratorHash(input: inp, output: out)
        }
        else if (out.characters.count >= 10){
            out = out.substring(to: 10)
        }
        return out
    }
    
    func combineTwoValues(val1: Int, val2: Int) -> Int{
        var result: Int = (val1+1) * (val1+1) + (val2 + 2) * (val2 + 2) + val1 + val2
        return result % 10
    }
    
    func convertStringToNum(val: String) -> Int{
        switch val {
            case "0": return 1
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        case "a": return 10
        case "b": return 11
        case "c": return 12
        case "d": return 13
        case "e": return 14
        case "f": return 15
        case "g": return 16
        case "h": return 17
        case "i": return 18
        case "j": return 19
        case "k": return 20
        case "l": return 21
        case "m": return 22
        case "n": return 23
        case "o": return 24
        case "p": return 25
        case "q": return 26
        case "r": return 27
        case "s": return 28
        case "t": return 29
        case "u": return 30
        case "v": return 31
        case "w": return 32
        case "x": return 33
        case "y": return 34
        case "z": return 35
        default:
            return 36
        }
        
    }
    

}




















