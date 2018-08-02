//
//  ViewController.swift
//  04.PullToRefresh
//
//  Created by 王博 on 2018/8/1.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var dataSource = Array<Date>()
    var refresh = UIRefreshControl()
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView(frame: self.view.bounds)
        table.backgroundColor = UIColor.white
        table.frame.origin.y = 60
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        addDataToArray()
        refresh.attributedTitle = NSAttributedString(string: "拉！使劲拉")
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControlEvents.valueChanged)
        table.addSubview(refresh)
        table.reloadData()
        
    }

    @objc func pullTheRefresh() {
        addDataToArray()
        refresh.endRefreshing()
        table.reloadData()
    }
    
    func addDataToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellId")
        let date = DateFormatter()
        date.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = date.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }
}

