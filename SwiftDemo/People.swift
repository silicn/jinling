//
//  People.swift
//  SwiftDemo
//
//  Created by silicn on 2019/6/10.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class People: NSObject {

    var name:String
    init(name:String){
        self.name = name;
    }
    
    func addName(name:String) {
        self.name = name;
    }
}
