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
    
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var userIconButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    let APP_Width:CGFloat = UIScreen.main.bounds.width
    weak  var delegate:GAB_LeftViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 如果图片格式 不是 png 记得要加上图片格式
        self.view.backgroundColor = UIColor(patternImage: UIImage.init(named: "leftBackGroundImage.jpg")!)
        configSubview()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        viewWidth.constant = leftDrawerWidth
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 因为是 xib 中的按钮 只能 放到这个方法中去调整大小
        adjustButtonLabelAndImageFrame()
        
    }
    
    // 调整 userIconButton 的 titleLabel 和 imageView 的位置
    func adjustButtonLabelAndImageFrame(){
        
        
        //        userIconButton.titleLabel?.backgroundColor = UIColor.orange
        //        userIconButton.imageView?.backgroundColor = UIColor.red
        //        userIconButton.backgroundColor = UIColor.lightGray
        
        /// 实现按钮的上图下字 效果
        /// -[[iOS]详解调整UIButton的title和image的位置](http://blog.csdn.net/lqq200912408/article/details/51323336)
        
        //        var buttonImageFrame:CGRect = (userIconButton.imageView?.frame)!
        //        buttonImageFrame.size = CGSize.init(width: 30, height: 30)
        //        userIconButton.imageView?.frame = buttonImageFrame
        
        let titleHeight:CGFloat = (userIconButton.titleLabel?.frame.size.height)!
        let titleWidth:CGFloat = (userIconButton.titleLabel?.frame.size.width)!
        let imageHeight:CGFloat = (userIconButton.imageView?.frame.size.height)!
        let imageWidth:CGFloat = (userIconButton.imageView?.frame.size.height)!
        let interval:CGFloat = 0.0
        userIconButton.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - interval, -(imageHeight + interval), 0);
        userIconButton.imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight + interval), 0, 0, -(titleWidth+interval));
    }
    
    
    func configSubview() {
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")

        self.tableview.tableFooterView = UIView()
        self.tableview.backgroundColor = UIColor.clear
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableview .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell :" + "\(indexPath.row)"
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第 : \(indexPath.row) 个 cell")

        self.delegate?.pushToNewViewController(index: indexPath.row)
    }
}
