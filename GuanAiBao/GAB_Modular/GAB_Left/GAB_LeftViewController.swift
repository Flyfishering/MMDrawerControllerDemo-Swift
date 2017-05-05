//
//  GAB_LeftViewController.swift
//  GuanAiBao
//
//  Created by mac on 17/5/5.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit


public protocol GAB_LeftViewControllerDelegate :class{
    /// 让 GAB_CenterViewController 遵守 去跳转
    func pushToNewViewController(index:Int)
}

class GAB_LeftViewController: GAB_BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    let APP_Width:CGFloat = UIScreen.main.bounds.width
    weak  var delegate:GAB_LeftViewControllerDelegate?
    
    var tableview:UITableView = UITableView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orange
        creatSubview()
    }

    func creatSubview() {
        self.tableview = UITableView.init(frame: self.view.bounds, style: .grouped)
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.tableFooterView = UIView()
        self.view.addSubview(self.tableview)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableview .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell :" + "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第 : \(indexPath.row) 个 cell")

        self.delegate?.pushToNewViewController(index: indexPath.row)
    }

}
