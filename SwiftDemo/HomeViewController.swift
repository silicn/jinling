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

    
    var tableView:UITableView?
    var dataSource:Array<KnowEntity>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        self.tableView = UITableView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain);
        
        self.tableView?.delegate = self as UITableViewDelegate
        self.tableView?.dataSource = self as UITableViewDataSource
        
        self.view.addSubview(self.tableView!);
        
        self.tableView?.register(UINib.init(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
        
        requestData()
        
        

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


extension HomeViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20;
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell") as! HomeViewCell
        return cell
    }
    
    func requestData(){
        let urlString = "https://www.ratjin.com/rat/topic/list"
        let url:URL = URL(string: urlString)!
        
        Alamofire.request(url,method:.post).responseJSON { (response) in
            if response.result.isSuccess {
                print(response.result.value as Any)
                
                if let json = response.result.value {
                    let dic = try? JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    let array = dic?["list"]
                    for dictionary in array{
                    }
                }

                
            }else{
                print("request error")
            }
        }
    }
}
