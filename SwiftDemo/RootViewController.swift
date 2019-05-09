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
        let mineVC = MineViewController()
        mineVC.tabBarItem.title = "我"
        self.viewControllers = [homeVC,mineVC];
        
        

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
