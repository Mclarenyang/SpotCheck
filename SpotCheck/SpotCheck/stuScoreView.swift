//
//  stuScoreView.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/6.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit
import Spring

class stuScoreView: SpringView {

    //成绩
    var Score = UITextField(frame: CGRect(x:100,y:80,width:100,height:80))
    
    var name = UILabel(frame: CGRect(x:77,y:270,width:200,height:33))
    var classNum = UILabel(frame: CGRect(x:77,y:333,width:200,height:33))
    var AllScore = UILabel(frame: CGRect(x:77,y:390,width:200,height:33))
    let image = UIImage(named:"postScoreCell.png")
    
    //网络请求对应的打分Id
    
    var stuId : Int!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
