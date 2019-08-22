//
//  CircleViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/31.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

import SnapKit


protocol Greetable {
   
}

extension Greetable {
    func sayHi(){
        print("Hello");
    }
}

class Animati: Greetable {
     func sayHi(){
        print("Animati")
    }
}

class LoudPerson: Animati {
  
}

class CircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Circle"
        
        let stackView = UIView()
        self.view.addSubview(stackView)
        stackView.backgroundColor = UIColor.cyan
        
        stackView.snp_makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        
//        var sub:Animati = LoudPerson()
//        sub.sayHi()
        
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

