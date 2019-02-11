//
//  ViewController.swift
//  LeatCode
//
//  Created by WangBo on 2019/2/11.
//  Copyright © 2019 wangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        
        let nums = [1,2,3,4,10,6]
        let target = 16
        let result = twoNumAdd(nums: nums, target: target)
        print("两数之和的结果是 \(result ?? [])")
        
    }


}


//两数之和
func twoNumAdd(nums:[Int], target:Int) -> [Int]? {

    for i in 0..<nums.count {
        print("index:\(i),value:\(nums[i])")
        
        for j in i+1..<nums.count {
            let r = target - nums[i]
            if nums[j] == r {
                return [i, j]
            }
        }
    }
    
    return []
}
