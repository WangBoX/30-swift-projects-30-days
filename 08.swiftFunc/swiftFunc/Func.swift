//
//  Func.swift
//  swiftFunc
//
//  Created by WangBo on 2018/9/15.
//  Copyright © 2018年 wangbo. All rights reserved.
//

/*函数是一段完成特定任务的独立代码片段
 在 Swift 中，每个函数都有一个由函数的参数值类型和返回值类型组成的类型
 */

import UIKit

class Func: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        _ = greet(person: "二维火")
        
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        
    }
    
    /// 函数的名字是 greet(person:)
    /// func是前缀
    /// - Parameter person: 函数的实参（参数）
    /// - Returns: 指定函数返回类型时，用返回箭头 ->
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    //无参数函数
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    //多参数函数，函数可以有多种输入参数，这些参数被包含在函数的括号之中，以逗号分隔
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    //多重返回值函数
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    //嵌套函数
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        
        func stepBackward(input: Int) -> Int { return input - 1 }
        
        return backward ? stepBackward : stepForward
    }

}

