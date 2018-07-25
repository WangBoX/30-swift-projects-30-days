//
//  ViewController.swift
//  02.singleView
//
//  Created by WangBo on 2018/7/25.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit
import SnapKit

// oc 
@objc(ViewController)
public class ViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "右键", style: UIBarButtonItemStyle.plain, target: self, action: #selector(right))
        self.navigationItem.rightBarButtonItem = item
        view.backgroundColor = UIColor.white
        cashIV.contentMode = .scaleAspectFill
        setupSubViews()
        subViewsLayout()
    }
    
    func setupSubViews() {
        view.addSubview(cashIV)
        view.addSubview(tipTitleL)
        view.addSubview(detailL)
        view.addSubview(retryBtn)
    }
    func subViewsLayout() {
        cashIV.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(-100)
            $0.width.height.equalTo(200)
        }
        tipTitleL.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(cashIV.snp.bottom).offset(20)
            $0.left.right.equalTo(view)
        }
        detailL.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(tipTitleL.snp.bottom).offset(30)
            $0.left.equalTo(view).offset(20)
            $0.right.equalTo(view).offset(-20)
        }
        retryBtn.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(detailL.snp.bottom).offset(40)
            $0.left.equalTo(detailL.snp.left).offset(10)
            $0.right.equalTo(detailL.snp.right).offset(-10)
            $0.height.equalTo(50)
        }
        
        
    }
    
    @objc func retryRequest() {
        print("retry")
    }
    @objc func right() {
        print("right")
    }
    lazy var cashIV:UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "test.jpg")
        
        return iv
    }()
    
    lazy var tipTitleL:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "nice"
        return label
    }()
    
    lazy var detailL:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.text = "To this man we reported our arrival, and a camping ground was pointed out to us. It was too late to do anything towards preparing a permanent camp that night, but at daybreak the following morning we were hard at work, and by evening had made ourselves a comfortable hut."
        return label
    }()
    
    lazy var retryBtn:UIButton = {
        let btn = UIButton()
        let image = UIColor.red.translateIntoImage()
        btn.setBackgroundImage(image, for: UIControlState.normal)
        btn.setTitle("CHAPTER XII.", for: .normal)
        btn.addTarget(self, action: #selector(retryRequest), for: UIControlEvents.touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
}



