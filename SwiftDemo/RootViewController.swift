//
//  RootViewController.swift
//  SwiftDemo
//
//  Created by jiahao on 2019/4/11.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "主页"
        let audioVC = AudioViewController()
        audioVC.tabBarItem.title = "主页"
        
        let drawVC = DrawViewController()
        drawVC.title =  "画图"
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.title = "主页"
        let mineVC = MineViewController()
        mineVC.tabBarItem.title = "我"
        
        print("1.1")
        
        let drawNav = UINavigationController(rootViewController: drawVC)
        
        let mineNav = UINavigationController(rootViewController: mineVC)
        mineNav.title = "我"
        
        print("test 1");
        
        print("test 2");
        self.viewControllers = [homeNav,drawNav,mineNav];
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
