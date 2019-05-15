//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/14.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

import SnapKit


class DetailViewController: UIViewController {

    var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "详情"
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        header.backgroundColor = UIColor.cyan
        self.view.addSubview(header)
        
        header.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(300)
            make.top.equalTo(self.view.snp_topMargin)
        } 
        
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30));
        lable.text = "测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下测试一下"
        lable.numberOfLines = 0
        lable.backgroundColor = UIColor.red
        header.addSubview(lable)
        
        lable.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(header.snp_top)
        }
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(header.snp_bottom)
            make.left.right.equalTo(0)
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        

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

extension DetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") 
        if  cell == nil  {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "测试Swift"
         
        return cell!
    }
}
