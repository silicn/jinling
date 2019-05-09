//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/4/11.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        
        
        

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

extension HomeViewController {
    func requestData(){
        let urlString = "https://www.ratjin.com/rat/topic/list"
        let url:URL = URL(string: urlString)!
        
        Alamofire.request(url,method:.post).responseJSON { (response) in
            if response.result.isSuccess {
                print(response.result.value as Any)
                var dataSource:Array<KnowEntity>?
                
            }else{
                print("request error")
            }
        }
    }
}
