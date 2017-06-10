//
//  classViewController.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/5.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit

class classViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var peopleNum_1 = UILabel(frame: CGRect(x:27,y:73,width:152,height:33))
    var peopleNum_2 = UILabel(frame: CGRect(x:27,y:73,width:152,height:33))
    var peopleNum_3 = UILabel(frame: CGRect(x:27,y:73,width:152,height:33))
    
    var major_1 = UILabel(frame: CGRect(x:120,y:30,width:200,height:33))
    var major_2 = UILabel(frame: CGRect(x:120,y:30,width:200,height:33))
    var major_3 = UILabel(frame: CGRect(x:120,y:30,width:200,height:33))
    
    var classNum1 = UILabel(frame: CGRect(x:150,y:73,width:152,height:33))
    var classNum2 = UILabel(frame: CGRect(x:150,y:73,width:152,height:33))
    var classNum3 = UILabel(frame: CGRect(x:150,y:73,width:152,height:33))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.viewWithTag(404)?.isHidden = true
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
        self.navigationController?.navigationBar.barTintColor = UIColor(red:117/255,green:87/255,blue:233/255 ,alpha:1)
        self.navigationItem.title = "班级"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        let backgView = UIImageView(frame: UIScreen.main.bounds)
        backgView.image = UIImage(named:"classbackground.png")
        self.view.addSubview(backgView)
        
        //测试
        classInfoUpdate()
        
        //3 Class
        let classCell_1 = UIView(frame: CGRect(x:40,y:114,width:344,height:130))
        let image1 = UIImage(named:"class1.png")
        classCell_1.backgroundColor = UIColor(patternImage:image1!)
        self.view.addSubview(classCell_1)
        
        peopleNum_1.textColor = UIColor.white
        peopleNum_1.font = UIFont.systemFont(ofSize: 36)
        classCell_1.addSubview(peopleNum_1)
        major_1.textColor = UIColor(red:23/255,green:28/255,blue:28/255 ,alpha:1)
        major_1.font = UIFont.systemFont(ofSize : 24)
        classCell_1.addSubview(major_1)
        classNum1.textColor = UIColor(red:106/255,green:96/255,blue:96/255 ,alpha:1)
        classNum1.font = UIFont.systemFont(ofSize : 23)
        classCell_1.addSubview(classNum1)
        
        classCell_1.isUserInteractionEnabled = true
        let guesture1 = UITapGestureRecognizer(target:self, action:#selector(tapClass1))
        classCell_1.addGestureRecognizer(guesture1)
        
        
        
        let classCell_2 = UIView(frame: CGRect(x:40,y:276,width:344,height:130))
        let image2 = UIImage(named:"class2.png")
        classCell_2.backgroundColor = UIColor(patternImage:image2!)
        self.view.addSubview(classCell_2)
        peopleNum_2.textColor = UIColor.white
        peopleNum_2.font = UIFont.systemFont(ofSize: 36)
        classCell_2.addSubview(peopleNum_2)
        major_2.textColor = UIColor(red:23/255,green:28/255,blue:28/255 ,alpha:1)
        major_2.font = UIFont.systemFont(ofSize : 24)
        classCell_2.addSubview(major_2)
        classNum2.textColor = UIColor(red:106/255,green:96/255,blue:96/255 ,alpha:1)
        classNum2.font = UIFont.systemFont(ofSize : 23)
        classCell_2.addSubview(classNum2)
        
        classCell_2.isUserInteractionEnabled = true
        let guesture2 = UITapGestureRecognizer(target:self, action:#selector(tapClass1))
        classCell_2.addGestureRecognizer(guesture2)
        
        let classCell_3 = UIView(frame: CGRect(x:40,y:438,width:344,height:130))
        let image3 = UIImage(named:"class3.png")
        classCell_3.backgroundColor = UIColor(patternImage:image3!)
        self.view.addSubview(classCell_3)
        peopleNum_3.textColor = UIColor.white
        peopleNum_3.font = UIFont.systemFont(ofSize: 36)
        classCell_3.addSubview(peopleNum_3)
        major_3.textColor = UIColor(red:23/255,green:28/255,blue:28/255 ,alpha:1)
        major_3.font = UIFont.systemFont(ofSize : 24)
        classCell_3.addSubview(major_3)
        classNum3.textColor = UIColor(red:106/255,green:96/255,blue:96/255 ,alpha:1)
        classNum3.font = UIFont.systemFont(ofSize : 23)
        classCell_3.addSubview(classNum3)
        
        classCell_3.isUserInteractionEnabled = true
        let guesture3 = UITapGestureRecognizer(target:self, action:#selector(tapClass1))
        classCell_3.addGestureRecognizer(guesture3)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //更新班级信息
    func classInfoUpdate(){
        
        //测试 boom 没有做接口
        peopleNum_1.text = "10"
        major_1.text = "通信软件教学班1"
        classNum1.text = "01041401"
        peopleNum_2.text = "09"
        major_2.text = "通信软件教学班2"
        classNum2.text = "01041402"
        peopleNum_3.text = "10"
        major_3.text = "通信软件教学班3"
        classNum3.text = "01041403"
    }
    
    //跳转
    func tapClass1() {
        
        let  stuview = stuViewController()
        stuview.classNum = classNum1.text
        self.navigationController?.pushViewController(stuview, animated: true)
        
    }
    
    func tapClass2() {
        
        let  stuview = stuViewController()
        stuview.classNum = classNum2.text
        self.navigationController?.pushViewController(stuview, animated: true)
        
    }
    
    func tapClass3() {
        
        let  stuview = stuViewController()
        stuview.classNum = classNum3.text
        self.navigationController?.pushViewController(stuview, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
