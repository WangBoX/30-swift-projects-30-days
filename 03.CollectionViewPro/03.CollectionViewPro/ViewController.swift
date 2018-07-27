//
//  ViewController.swift
//  03.CollectionViewPro
//
//  Created by WangBo on 2018/7/26.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var flowLayout:UICollectionViewFlowLayout!
    var customLayout:CustomLayout!
    var collectionView:UICollectionView!
    
    let CellIdentifier = "myCell"
    
    let courses = [
        ["name":"Swift", "pic":"swift.png"],
        ["name":"Xcode","pic":"xcode.png"],
        ["name":"Java","pic":"java.png"],
        ["name":"PHP","pic":"php.png"],
        ["name":"JS","pic":"js.png"],
        ["name":"React","pic":"react.png"],
        ["name":"Ruby","pic":"ruby.png"],
        ["name":"HTML","pic":"html.png"],
        ["name":"C#","pic":"c#.png"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navigationController?.title = "collectionView"
        let item = UIBarButtonItem(title: "切换", style: UIBarButtonItemStyle.plain, target: self, action: #selector(chanStatus))
        self.navigationItem.rightBarButtonItem = item
        initCollectionView()
    }
    
    private func initCollectionView() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        customLayout = CustomLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: customLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .red
        
        let cellXIB = UINib.init(nibName: "MyCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellXIB, forCellWithReuseIdentifier: CellIdentifier)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    
    @objc func chanStatus() {
        self.collectionView.collectionViewLayout.invalidateLayout()
        let newLayout = collectionView.collectionViewLayout.isKind(of: CustomLayout.self) ? flowLayout : customLayout
        collectionView.setCollectionViewLayout(newLayout, animated: true)
        let indexPath = IndexPath(row: 0, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    
    
}


//dataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as!  MyCollectionViewCell
        cell.label.text = courses[indexPath.item]["name"]
        cell.imageView.image = UIImage(named: courses[indexPath.item]["pic"]!)
        
        return cell
    }
}

//delegate
extension ViewController: UICollectionViewDelegate {
    
}






