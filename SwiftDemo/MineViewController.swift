//
//  MineViewController.swift
//  SwiftDemo
//
//  Created by jiahao on 2019/4/11.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit
import SnapKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange

        let circle = CircleView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        circle.backgroundColor = UIColor.white
        self.view.addSubview(circle)
        circle.snp_makeConstraints { (make) in
            make.center.equalTo(self.view.snp_center)
            make.width.height.equalTo(300)
        }
        
        let btn = UIButton(type:.custom)
        btn.backgroundColor = .white
        btn.setTitle("Loading", for:.normal)
        btn.setTitleColor(.cyan, for:.normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16.0)
        self.view.addSubview(btn)
        btn.addTarget(self, action:#selector(self.btnAction(btn:)), for:.touchUpInside)
        
        btn.snp_makeConstraints { (make) in
            make.top.equalTo(circle.snp_bottomMargin).offset(16)
            make.centerX.equalTo(circle.snp_centerX)
            make.width.equalTo(60)
        }
        print("dev1");
        
        print("dev2");
        
        
        print("master");
        
        print("new dev1")
        
        // Do any additional setup after loading the view.
    }
    
    @objc func btnAction(btn:UIButton) {
        print("btnAction")
        
        print("dev 22")
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
