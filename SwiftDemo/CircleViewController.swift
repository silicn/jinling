//
//  CircleViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/31.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

import SnapKit

class CircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Circle"
        
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 300, height:800))
         self.view.addSubview(stackView)
        stackView.backgroundColor = UIColor.cyan
        
        stackView.snp_makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        let btn = UIButton()
        btn.setTitle("测试", for:.normal)
        stackView.addArrangedSubview(btn)
        
        
        
        
       
        

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
