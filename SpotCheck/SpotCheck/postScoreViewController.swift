//
//  postScoreViewController.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/6.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit

class postScoreViewController: UIViewController {
    
    var stuNum : Int = 3
    var viewTag : Int = 1003
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "抽查打分"
        
        let backgView = UIImageView(frame: UIScreen.main.bounds)
        backgView.image = UIImage(named:"postScoreBackgroung.png")
        self.view.addSubview(backgView)
        regView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func regView(){
        
        var y:Double = 73
        
        for i in 1...stuNum {
            
            let stuView = stuScoreView(frame: CGRect(x:55,y:y,width:300,height:465))
            stuView.tag = i + 1000
            stuView.backgroundColor = UIColor(patternImage: stuView.image!)
            stuView.addSubview(stuView.classNum)
            stuView.addSubview(stuView.AllScore)
            stuView.addSubview(stuView.name)
            stuView.addSubview(stuView.Score)
            self.view.addSubview(stuView)
            y = y + Double(i * 6)
        }
       
    }
    
    func nextOne(){
        self.view.viewWithTag(viewTag)?.removeFromSuperview()
        viewTag = viewTag - 1
    }
    
    func lastOne(){
        view.viewWithTag(viewTag)
        viewTag = viewTag + 1
    }
    
    func postScore(){
        //提交分数
    }
    
    func getInfo(){
        
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
