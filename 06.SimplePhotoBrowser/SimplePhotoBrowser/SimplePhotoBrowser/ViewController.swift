//
//  ViewController.swift
//  SimplePhotoBrowser
//
//  Created by WangBo on 2018/9/10.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var imageView: UIImageView = {
        let v = UIImageView(frame: self.view.bounds)
        v.image = UIImage(named: "samplePhoto.jpeg")
        v.isUserInteractionEnabled = true
        return v
    }()
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView(frame: self.view.bounds)
        v.maximumZoomScale = 4.0
        v.minimumZoomScale = 1.0
        v.backgroundColor = UIColor.black
        v.contentSize = imageView.bounds.size
        v.delegate = self
        return v
    }()
}

