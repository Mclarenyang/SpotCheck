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
    dynamic var sex: String!
    dynamic var classNumber: String!
    dynamic var sno = 0
    dynamic var name: String!
    dynamic var totalScore = 0
    dynamic var times = 0
    
    
    override class func primaryKey() -> String? {
        return "sno"
    }

}
