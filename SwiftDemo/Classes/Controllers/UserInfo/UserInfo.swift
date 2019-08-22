//
//  UserInfo.swift
//  SwiftDemo
//
//  Created by silicn on 2019/8/21.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class UserInfo: NSObject {

    var is_login:Bool = false;
    
    var userId:String?
    var username:String?
    
    
    
    static let shareInstance:UserInfo = {
        let instance = UserInfo()
        return instance
    }()
    
    func login(){
        is_login = true;
        userId = "123456"
        username = "silicn"
    }
    
    func logout(){
        is_login = false
        userId = nil
        username = nil
    }
    
    func doc_path() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first ?? ""
        let a_path = path + "/userinfo.data"
        return a_path
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        is_login = aDecoder.decodeBool(forKey: "is_login")
//        userId =  aDecoder.decodeObject(forKey: "userid") as? String
//        username = (aDecoder.decodeObject(forKey: "username") as? String)
//        super.init()
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder){
//        
//        aCoder.encode(is_login, forKey: "is_login")
//        aCoder.encode(userId, forKey: "userid")
//        aCoder.encode(username, forKey: "username")
//    }
    
}
