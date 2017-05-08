//
//  AppDelegate.swift
//  GuanAiBao
//
//  Created by mac on 17/5/4.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import MMDrawerController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var mmDrawerController:MMDrawerController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        /// 创建左中右控制器
        let centerController:GAB_CenterViewController = GAB_CenterViewController()
        let leftController:GAB_LeftViewController = GAB_LeftViewController(nibName: "GAB_LeftViewController", bundle: nil)
        let rightController:GAB_RightViewController = GAB_RightViewController()
        


        
        
        //加入导航控制器 并设置重用标志
        let centerNav:GAB_BaseNavigationController = GAB_BaseNavigationController(rootViewController: centerController)
        centerNav.restorationIdentifier = "GAB_CenterViewController"
        //左视图 不需要加入导航控制器
        //let leftSideNav:GAB_BaseNavigationController = GAB_BaseNavigationController(rootViewController: leftController)
        //leftSideNav.restorationIdentifier = "GAB_LeftViewController"
        
        leftController.restorationIdentifier = "GAB_LeftViewController"
        let righSideNav:GAB_BaseNavigationController = GAB_BaseNavigationController(rootViewController: rightController)
        righSideNav.restorationIdentifier = "GAB_RightViewController"
        

        
    
        mmDrawerController = MMDrawerController.init(center: centerNav, leftDrawerViewController:leftController, rightDrawerViewController: righSideNav)
        mmDrawerController?.restorationIdentifier = "MMDrawerController"
        mmDrawerController?.showsShadow = false
        
        mmDrawerController?.maximumRightDrawerWidth = leftDrawerWidth
        mmDrawerController?.maximumLeftDrawerWidth = leftDrawerWidth
        mmDrawerController?.setDrawerVisualStateBlock({ (drawerController, drawerSide, percentVisible) in
           
            //设置动画，这里是设置打开侧栏透明度从0到1
            
//            var sideDrawerViewController:UIViewController?
//            if(drawerSide == MMDrawerSide.left){
//                sideDrawerViewController = drawerController?.leftDrawerViewController;
//            }
//            if(drawerSide == MMDrawerSide.left){
//                sideDrawerViewController = drawerController?.rightDrawerViewController;
//            }
//            sideDrawerViewController?.view.alpha = percentVisible
            

            
            //设置视觉差动画
            let block: MMDrawerControllerDrawerVisualStateBlock = MMDrawerVisualState.parallaxVisualStateBlock(withParallaxFactor: 2.0);
            block(drawerController, drawerSide, percentVisible)
        });
        //打开抽屉手势
        mmDrawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningNavigationBar
        //关闭抽屉手势
        mmDrawerController?.closeDrawerGestureModeMask = .all
        self.window?.rootViewController = mmDrawerController
        
        /*
         //self.window = UIWindow.init(frame: UIScreen().bounds)
         //self.window?.backgroundColor = UIColor.white
         //self.window?.makeKeyAndVisible()
         
         swift 默认已经创建好了一个 白色背景 的 Window 不需要我们重新 再 创建了,(可能这个window 就是 main.storybord)
         */
        
        return true
    }
    
    
    
    
    
    func appearanceForApplication(){
        
        let nav = GAB_BaseNavigationController()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

