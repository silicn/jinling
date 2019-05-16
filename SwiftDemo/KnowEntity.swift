//
//  KnowEntity.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/8.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class KnowEntity: NSObject {
    var _id:String!
    var comments:Int!
    var content:String?
    
    init(id:String,comments:Int,content:String) {
        super.init()
        self._id = id
        self.comments = comments
        self.content = content
    }
    
    init(dic:Dictionary<String, Any>){
        super.init()
        self._id = dic["id"] as? String
        self.content = dic["content"] as? String
        self.comments = dic["comments"] as? Int
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
   
    
}
