//
//  student.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/10.
//  Copyright © 2017年 NMID. All rights reserved.
//

import Foundation
import RealmSwift

class Student : Object{

    // 学生对象的属性
    
    override static func primaryKey()-> String{
    return "primaryKey"
    }

}
