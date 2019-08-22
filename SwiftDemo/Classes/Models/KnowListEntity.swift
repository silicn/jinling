//
//  KnowListEntity.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/31.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit
import HandyJSON

class KnowListEntity: HandyJSON {
    
    

    var id:String?
    var comments:String?
    var content:String?
    var follows:Int = 0
    var title:String?
    
    required init() {}
   
//    init(_ dic:Dictionary<String, Any>){
//        self.id = dic["id"] as? String
//        self.content = dic["content"] as? String
//        self.comments = dic["comments"] as? String
//        self.follows = dic["follows"] as! Int
//        self.title = dic["title"] as? String
//    }
    
    
}
