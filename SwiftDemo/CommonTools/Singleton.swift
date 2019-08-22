//
//  Singleton.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/20.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit


class Singleton: NSObject {
    var name:String!
    var userId:String!
    
    static let shareInstance:Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    
}
