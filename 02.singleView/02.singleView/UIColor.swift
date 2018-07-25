//
//  UIColor.swift
//  02.singleView
//
//  Created by WangBo on 2018/7/25.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    public func translateIntoImage(frame:CGRect? = CGRect.init(x: 0, y: 0, width: 1, height: 1)) -> UIImage {

        let rect = frame ?? CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
