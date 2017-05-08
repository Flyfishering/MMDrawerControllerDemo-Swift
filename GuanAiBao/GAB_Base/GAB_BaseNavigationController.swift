//
//  GAB_BaseNavigationController.swift
//  GuanAiBao
//
//  Created by mac on 17/5/5.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class GAB_BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        let appearance:UINavigationBar = UINavigationBar.appearance()
        appearance.barTintColor = navigationBarBackGroundColor()
        appearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
          NSFontAttributeName:UIFont.systemFont(ofSize: 17.0)]
        
        
        //[UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.086 green:0.643 blue:0.882 alpha:1.000];
        //.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
            //NSFontAttributeName:[UIFont systemFontOfSize:17.0]};
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
