//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/14.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

import SnapKit

enum StudentType{
    case pupil(String)
    case middle(Int,String)
    case college(Int,String)
}

class DetailViewController: UIViewController {

    var tableView:UITableView!
    
    var content:String?
    
    var isComplete:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "详情"
        
        
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        self.tableView = tableView
        
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top)
            make.left.right.equalTo(0)
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        let header = UIView()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30));
        label.text = self.content
        label.numberOfLines = 0
        header.addSubview(label)
        
        header.snp_makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(header.snp_leftMargin).offset(8)
            make.right.equalTo(header.snp_rightMargin).offset(8)
            make.top.equalTo(header.snp_top)
            make.bottom.equalTo(header.snp_bottom)
        }
       
        self.tableView.tableHeaderView = header;
        
        let height = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = header.bounds;
        frame.size.height = height;
        header.frame = frame;
        
        self.tableView.tableHeaderView = header;
      
        self.tableView.tableHeaderView?.setNeedsLayout();
        self.tableView.tableHeaderView?.layoutIfNeeded();
        
        print(self.tableView.frame)
        
        let queue = DispatchQueue.global()
        
        queue.asyncAfter(deadline: DispatchTime.now() + 2) { 
            let main = DispatchQueue.main
            main.async {
                self.printFrame()
            }
        }
        
        
//        self.perform(#selector(printFrame)) 
        
        self.perform(#selector(printFrame), with: nil, afterDelay: 2.0)

        requestDataComplete { (str) in
            print("complete request \(str)")
        }
        
        // Do any additional setup after loading the view.
    }
    
   @objc  func printFrame(){
        print(self.tableView.frame)
    }

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let circleVc = CircleViewController()
        self.navigationController?.pushViewController(circleVc, animated: true)
    }
    
    func requestDataComplete(block:(_ dic:String)->()){
        self.isComplete = false
        defer {
            self.isComplete = true
        }
        block("complete")
    }
    
    func makeAdd(_ num:Int)->(Int)->Int{
        return  { mutail in
            mutail * num;
        }
    }
    
    func speend(_ str:String) ->(String)->String{
        return { _ in
            "nihao" + str
        }
    }
    
}
