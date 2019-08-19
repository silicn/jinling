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
   private var dataSource:Array<KnowListEntity> = Array<KnowListEntity>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        self.title = "主页"
        
        self.tableView = UITableView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain);
        
        self.tableView?.delegate = self as UITableViewDelegate
        self.tableView?.dataSource = self as UITableViewDataSource
        
        self.view.addSubview(self.tableView!);
        
        self.tableView?.register(UINib.init(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
        requestData()
        
        numformatter_test()
        
        
       let add = test();
       print(add(33));
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func test()->(Int)->(Int){
        return {
            (Int) -> Int in {
                return 2;
            }()
        }
    }
    
    func numformatter_test(){
        let num = NSNumber(value: 12344.34);
        
        let numFormatter = NumberFormatter()
        
        numFormatter.locale = Locale(identifier: "zh_Hans_CN");
        
        numFormatter.numberStyle = .ordinal
        print(numFormatter.string(from: num) as Any)
        
        numFormatter.numberStyle = .currencyPlural
        print(numFormatter.string(from: num) as Any)
    }
    
    
    func isPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {return true}
        
        func isValid(_ character: Character) -> Bool {
            if character >= "a" && character <= "z" {
                return true
            }
            if character >= "0" && character <= "9" {
                return true
            }
            return false
        }
        
        let string = s.lowercased()
        var sArr = Array(string)
        var left = 0,right = sArr.count;
        
        while left <= right {
            if !isValid(sArr[left]){
                left += 1
            }
            if !isValid(sArr[right]){
                right -= 1
            }
            if sArr[left] == sArr[right]{
                left += 1
                right -= 1
            }else{
                break;
            }
        }
        if left <= right {
            return true
        }
        return false;
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
        return self.dataSource.count;
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell") as! HomeViewCell
        let know = self.dataSource[indexPath.row] as KnowListEntity?
        if let knowEntity = know {
            cell.textLab.text = knowEntity.content
            cell.comentsLab.text = String(format: "评论  %@",knowEntity.comments!)
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let circle = CircleViewController()
            self.navigationController?.pushViewController(circle, animated: true)
            return
        }
        let detaiVC = DetailViewController()
        let know = self.dataSource[indexPath.row]
        detaiVC.content = know.content
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detaiVC, animated: true);
    }
    
    func swaptwoValues<T>(_ a:inout  T,_ b:inout T){
        let temp = a
        a = b
        b = temp
    }
    
    
    func requestData(){
        let urlString = "https://www.ratjin.com/rat/topic/list"
        let url:URL = URL(string: urlString)!
        
        Alamofire.request(url,method:.post).responseJSON { (response) in
            if response.result.isSuccess {
                
                if response.result.value != nil {
                    print(response.result.value!)
                    let dic = try? JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.allowFragments) as?[String:Any]
                    let list = dic?["list"] as! [Dictionary<String,Any>]
//                    let dataSource =  list.map({ dic -> KnowEntity in
//                        let model = KnowEntity(dic:dic)
//                        return model
//                    })
//                    self.dataSource = Array(dataSource)
                    let _ = list.map({ (dic) -> KnowListEntity? in
                        if let model = KnowListEntity.deserialize(from: dic){
                            self.dataSource.append(model)
                            return model
                        }
                        return nil
                    })
                  
                }
                self.tableView?.reloadData()
            }else{
                print("request error")
            }
        }
    }
}
