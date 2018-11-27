//
//  ViewController.swift
//  Types
//
//  Created by WangBo on 2018/11/26.
//  Copyright © 2018 wangbo. All rights reserved.
//  类型转换

/*
 类型转换在 Swift 中使用 is 和 as 操作符实现
 is(类型检查操作符)
 as(类型转换操作符（as? 或 as!）)
 这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。
 
 */


import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        
        testAs()
        
        testAny()
        
        
        
    }
    
    fileprivate func testAs() {
        let peoples = [
            ManPeople(name: "fengli", age: 18),
            WomanPeople(name: "qingye", height: 170),
            ManPeople(name: "xuesong", age: 18)
        ]
        
        
        var manCount = 0
        var womanCount = 0
        
        //检查类型
        //用类型检查操作符（is）来检查一个实例是否属于特定子类型
        for people in peoples {
            if people is WomanPeople{
                womanCount += 2
            }else if people is ManPeople {
                manCount += 1
            }
        }
        
        print("男生人数 = \(manCount) 女生人数 = \(womanCount)")
        
        
        //向下转型
        //某类型的一个常量或变量可能在幕后实际上属于一个子类
        //当确定是这种情况时，你可以尝试向下转到它的子类型，用类型转换操作符（as? 或 as!）
        for people in peoples {
            if let woman = people as? WomanPeople {
                
                print("her name is \(woman.name), her height is \(woman.height)")
            }else if let man = people as? ManPeople {
                print("his name is \(man.name), his age is \(man.age)")
            }else if people is midProple {
                print("suprise")
            }
        }
    }
    
    func testAny() {
        /*Any 和 AnyObject 的类型转换
         Swift 为不确定类型提供了两种特殊的类型别名：
         
         Any 可以表示任何类型，包括函数类型。
         AnyObject 可以表示任何类类型的实例。
         */
        var things = [Any]()
        
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(WomanPeople(name: "mtx", height: 170))
        things.append({ (name: String) -> String in "Hello, \(name)" })
        
        //你可以在 switch 表达式的 case 中使用 is 和 as 操作符来找出只知道是 Any 或 AnyObject 类型的常量或变量的具体类型
        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let people as WomanPeople:
                print("\(people.name), \(people.height)")
            case let stringConverter as (String) -> String:
                print(stringConverter("swift"))
            default:
                print("something else")
            }
        }
        
        let optionalNumber: Int? = 3
        things.append(optionalNumber)        // 警告
        things.append(optionalNumber as Any) // 没有警告
        
        
        
        /*
        ///所有类型隐式一致的协议
        public typealias Any = protocol<>
        
        ///所有类隐式一致的协议
        @objc public protocol AnyObject {
        }
         总结：
         AnyObject是Any的子集
         所有用class关键字定义的对象就是AnyObject
         所有不是用class关键字定义的对象就不是AnyObject，而是Any
         
         在 Swift 中所有的基本类型，包括 Array 和 Dictionary 这些传统意义上会是 class 的东西，统统都是 struct 类型，并不能由 AnyObject 来表示。
          Any，除了 class 以外，它还可以表示包括 struct 和 enum 在内的所有类型
   
        
        func someMethod() -> AnyObject? {
            // ...
            
            // 返回一个 AnyObject?，等价于在 Objective-C 中返回一个 id
            return result
        }
        
        let anyObject: AnyObject? = SomeClass.someMethod()
        if let someInstance = anyObject as? SomeRealClass {
            // ...
            // 这里我们拿到了具体 SomeRealClass 的实例
            
            someInstance.funcOfSomeRealClass()
        }
         */

    }
    
    
    
}


//为类型转换定义类层次
class People {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class ManPeople: People {
    var age: Int
    init(name: String, age:Int) {
        self.age = age
        super.init(name: name)
    }
}


class WomanPeople: People {
    var height: Int
    init(name:String, height:Int) {
        self.height = height
        super.init(name: name)
    }
    
}

class midProple: People {
   
}

