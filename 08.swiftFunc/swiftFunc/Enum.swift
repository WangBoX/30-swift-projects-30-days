//
//  Enum.swift
//  swiftFunc
//
//  Created by WangBo on 2018/9/15.
//  Copyright © 2018年 wangbo. All rights reserved.
//

//枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。

import UIKit

class Enum: NSObject {
    //枚举语法
    enum SomeEnumeration {
        // 枚举定义放在这里
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    func EnumFunc() {
        var directionToHead = CompassPoint.west
        directionToHead = .east
        directionToHead = .south
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
    }
   
}
