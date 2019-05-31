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
   private var dataSource:Array<KnowEntity>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        self.title = "主页"
        
        self.tableView = UITableView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain);
        
        self.tableView?.delegate = self as UITableViewDelegate
        self.tableView?.dataSource = self as UITableViewDataSource
        
        self.view.addSubview(self.tableView!);
        
        self.tableView?.register(UINib.init(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
         self.dataSource = Array<KnowEntity>()
        requestData()
        
        
        let s1 = Singleton.shareInstance
        s1.name = "小花"
//        s1.userId = "123456"
        
        let s2  = Singleton.shareInstance
        
        print(s1,s2.name as Any,s2.userId as Any)
        
        
        
        
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
        return self.dataSource!.count;
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:HomeViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell") as! HomeViewCell
        let know = self.dataSource?[indexPath.row] as KnowEntity?
        cell.textLab.text = know!.content
        cell.comentsLab.text = String(format: "评论  %d",know!.comments)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaiVC = DetailViewController()
        
        let know = self.dataSource?[indexPath.row]
        detaiVC.content = know?.content
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detaiVC, animated: true);
    }
    
    
    func requestData(){
        let urlString = "https://www.ratjin.com/rat/topic/list"
        let url:URL = URL(string: urlString)!
        
        Alamofire.request(url,method:.post).responseJSON { (response) in
            if response.result.isSuccess {
                
                if response.result.value != nil {
                    print(response.result.value!)
                    let dic = try? JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.allowFragments) as?[String:Any]
                    let list = dic?["list"] as! [Any]
                   
                    for know in list {
                        let model = KnowEntity(dic: know as! Dictionary<String, Any>);
                        self.dataSource?.append(model)
                    }
                }
                self.tableView?.reloadData()
            }else{
                print("request error")
            }
        }
    }
}
