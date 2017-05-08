//
//  GAB_CenterViewController.swift
//  GuanAiBao
//
//  Created by mac on 17/5/5.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import MMDrawerController
class GAB_CenterViewController: GAB_BaseViewController,GAB_LeftViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationButton()

        self.title = "这是标题"
        
        // left drawer delegate
        let vc:GAB_LeftViewController = self.mm_drawerController.leftDrawerViewController as! GAB_LeftViewController
       
        vc.delegate = self
    }

    func setNavigationButton() {
        
        let leftBarButton:MMDrawerBarButtonItem = MMDrawerBarButtonItem(target: self, action: #selector(leftDrawerButtonPress( _: )))
        leftBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func leftDrawerButtonPress(_ barButtonItem:MMDrawerBarButtonItem) {
        //print("左边 导航栏 按钮点击")
        self.mm_drawerController.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    

    //MARK:- GAB_LeftViewControllerDelegate
    
    func pushToNewViewController(index: Int) {
        /// first close drawer
        self.mm_drawerController.closeDrawer(animated: true) { (complete) in
            //也可以在这里面 push
        }
        let vc:UIViewController = UIViewController()
        vc.view.backgroundColor = UIColor.white
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    
}
