//
//  Closures.swift
//  swiftFunc
//
//  Created by WangBo on 2018/9/15.
//  Copyright © 2018年 wangbo. All rights reserved.
//

/*闭包是匿名函数代码块，可以在代码中被传递和使用
 · 全局函数是一个有名字但不会捕获任何值的闭包
 · 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 · 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 */


import UIKit

class Closures: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

            
        /*闭包表达式语法
             { (parameters) -> return type in
             statements
             }
        */
        
        //Swift 标准库提供了名为 sorted(by:) 的方法，它会根据你所提供的用于排序的闭包函数将已知类型数组中的值进行排序
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        var reversedNames = names.sorted(by: backward)
        
        print(reversedNames)
        
        //闭包实现
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        
        //也就是
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
        
        //根据上下文推断类型
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
        //单表达式闭包隐式返回
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
        //参数名称缩写
        reversedNames = names.sorted(by: { $0 > $1 } )
        //运算符方法
        reversedNames = names.sorted(by: >)
        
        
        //尾随闭包:将一个很长的闭包表达式作为最后一个参数传递给函数
        /*
         closure ：参数
         后面跟着 () -> Void 是什么？函数，没有名字的函数块。是什么？就是闭包（匿名函数块）
         */
        func someFunctionThatTakesAClosure(closure: (Bool) -> Int) {
            // 函数体部分
        }
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure(closure: {(param) -> Int in
            // 闭包主体部分
            return 1
        })
        
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {(param) -> Int in
            // 闭包主体部分
            return 1
        }
        //尾随闭包：使用
        reversedNames = names.sorted() { $0 > $1 }
        //如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，可以把 () 省略掉
        reversedNames = names.sorted { $0 > $1 }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        //通过传递一个尾随闭包给 numbers 数组的 map(_:) 方法来创建对应的字符串版本数组：
        //Swift 的 Array 类型有一个 map(_:) 方法，这个方法获取一个闭包表达式作为其唯一参数。该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方式和返回值类型由闭包来指定。
        let strings = numbers.map {
            
            (number) -> String in//
            
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
            
        }
        print(strings)
        
        //值捕获 (闭包可以在其被定义的上下文中捕获常量或变量)
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        //incrementer() 从上下文中捕获了两个值，runningTotal 和 amount。
        //捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。
        let incrementByTen = makeIncrementer(forIncrement: 10)
        
        print(incrementByTen())// 返回的值为10
        
        print(incrementByTen())// 返回的值为20
        
        //如果你创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量：
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print(incrementBySeven())// 返回的值为7

        /*
        解决闭包的循环强引用
        在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用。
        注意
        Swift 有如下要求：只要在闭包内使用 self 的成员，就要用 self.someProperty 或者 self.someMethod()（而不只是 someProperty 或 someMethod()）。这提醒你可能会一不小心就捕获了 self。
         */
        
        //other
        //其他更高的语法自行探索😄
        
    }
    
    

    
}
