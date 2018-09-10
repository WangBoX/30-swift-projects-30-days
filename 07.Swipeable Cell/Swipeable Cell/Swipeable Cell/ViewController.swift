//
//  ViewController.swift
//  Swipeable Cell
//
//  Created by WangBo on 2018/9/10.
//  Copyright © 2018年 wangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate {

    private let cellHeight:CGFloat = 60
    private let colorRatio:CGFloat = 10
    private var actionController:UIAlertController!
    var table:UITableView!
    private let lyric = "函数是一段完成特定任务的独立代码片段,你可以通过给函数命名来标识某个函数的功能,这个名字可以被用来在需要的时候,“调用”这个函数来完成它的任务Swift 统一的函数语法非常的灵活,可以用来表示任何函数,包括从最简单的没有参数名字的,C风格函数,到复杂的带局部和外部参数名的,Objective-C 风格函数"
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.frame)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        
        self.dataSource = lyric.characters.split(separator: ",").map(String.init)
        
        actionController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight: CGFloat = table.bounds.size.height
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: cellHeight))
        let gLayer = CAGradientLayer()
        gLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor
        
        gLayer.colors = [lowerColor, upperColor]
        bgView.layer.addSublayer(gLayer)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        cell.frame.origin.y = cellHeight
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "👍") { action, index in
            self.actionController.message = "Thanks for your Love😸"
            self.showAlertController()
            print("delete")
        }
        likeAction.backgroundColor = UIColor.white
        let dislikeAction = UITableViewRowAction(style: .default, title: "👎") { action, index in
            self.actionController.message = "Tell me why!!!😤"
            self.showAlertController()
            print("done")
        }
        dislikeAction.backgroundColor = UIColor.white
        
        let unknowAction = UITableViewRowAction(style: .destructive, title: "🖖") { (action, index) in
            self.actionController.message = "What do you mean? 🤔"
            self.showAlertController()
            print("what?")
        }
        unknowAction.backgroundColor = UIColor.white
        return [likeAction, dislikeAction,unknowAction]
    }
    
    func showAlertController() {
        self.present(self.actionController, animated: true, completion: {
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                self.actionController.dismiss(animated: true, completion: nil)
            })
            RunLoop.main.add(dismissTimer, forMode: .commonModes)
        })
    }
    
    
}








