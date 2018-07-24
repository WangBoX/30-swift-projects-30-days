//
//  ViewController.swift
//  01.CustomFont
//
//  Created by WangBo on 2018/7/24.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Hello World! oh wo~~~"
        label.textAlignment = .center
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("Change Font Family", for: UIControlState.normal)
        changeBtn.addTarget(self, action: #selector(changeFontFamily), for: UIControlEvents.touchUpInside)
        changeBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view.addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 2
        changeBtn.layer.cornerRadius = 6
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeFontFamily() {
        let fontName = "SavoyeLetPlain"
        let nowFontName = label.font.fontName
        
        if nowFontName == fontName{
            label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        }else{
            label.font = UIFont(name: "Savoye LET", size: 30)
        }
    }
    
    func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("+++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }
        }
    }
    

}




