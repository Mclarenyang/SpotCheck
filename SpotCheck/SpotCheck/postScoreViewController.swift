//
//  postScoreViewController.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/6.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit
import Spring


class postScoreViewController: UIViewController {
    
    // 抽取学生数
    var stuNum : Int!
    var viewTag : Int!
    var maxTag : Int!
    
    // 抽取状态
    var state = 0
    
    // Back Button
    var leftbtn = UIButton()
    
    // 前后按钮
    var nextBtn : UIButton!
    var lastBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "抽查打分"
        
        let backgView = UIImageView(frame: UIScreen.main.bounds)
        backgView.image = UIImage(named:"postScoreBackgroung.png")
        self.view.addSubview(backgView)
        
        //Tag
        maxTag = viewTag
        
        // 返回
        self.navigationItem.hidesBackButton = true
        leftbtn = UIButton(frame: CGRect(x:0,y:0,width:80,height:50))
        leftbtn.setTitle("<Back", for: .normal)
        leftbtn.setTitleColor(UIColor.white, for: .normal)
        leftbtn.addTarget(self, action: #selector(leftBtnTap(_:)), for: UIControlEvents.touchUpInside)
        let item = UIBarButtonItem(customView: leftbtn)
        self.navigationItem.leftBarButtonItem = item
        
        //按钮
        nextBtn = UIButton(frame: CGRect(x:91,y:615,width:232,height:60))
        nextBtn.setBackgroundImage(UIImage(named:"nextOne.png"), for: .normal)
        nextBtn.setTitleColor(UIColor.white, for: .normal)
        nextBtn.addTarget(self, action: #selector(nextBtnTap), for: .touchUpInside)
        
        if stuNum == 1 {
            nextBtn.setTitle("确定", for: .normal)
        }else{
            nextBtn.setTitle("下一个", for: .normal)
        }
        self.view.addSubview(nextBtn)
        
        lastBtn = UIButton(frame: CGRect(x:40,y:615,width:160,height:60))
        lastBtn.setBackgroundImage(UIImage(named:"nextOne.png"), for: .normal)
        lastBtn.setTitleColor(UIColor.white, for: .normal)
        lastBtn.setTitle("上一个", for: .normal)
        lastBtn.addTarget(self, action: #selector(lastBtnTap), for: .touchUpInside)
        self.view.addSubview(lastBtn)
        lastBtn.isHidden = true
        
        regView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func regView(){
        
        for i in 1...stuNum {
            
            let stuView = stuScoreView(frame: CGRect(x:55,y: (90+Double(i * 6)),width:300,height:465))
            stuView.tag = i + 1000
            stuView.backgroundColor = UIColor(patternImage: stuView.image!)
            stuView.addSubview(stuView.classNum)
            stuView.addSubview(stuView.AllScore)
            stuView.addSubview(stuView.name)
            stuView.addSubview(stuView.Score)
            self.view.addSubview(stuView)
            
            // 控件修饰
            stuView.classNum.textColor = UIColor(red:62/255,green:62/255,blue:63/255 ,alpha:1)
            stuView.name.textColor = UIColor(red:62/255,green:62/255,blue:63/255 ,alpha:1)
            stuView.AllScore.textColor = UIColor(red:6/255,green:6/255,blue:6/255 ,alpha:1)
            stuView.Score.textColor = UIColor(red:117/255,green:81/255,blue:233/255 ,alpha:1)
            stuView.name.font = UIFont.systemFont(ofSize: 34)
            stuView.classNum.font = UIFont.systemFont(ofSize: 24)
            stuView.AllScore.font = UIFont.systemFont(ofSize: 24)
            stuView.Score.font = UIFont.boldSystemFont(ofSize: 70)
            
            // textfild 特别修饰
            stuView.Score.returnKeyType = UIReturnKeyType.next
            stuView.Score.keyboardType = .numbersAndPunctuation
            stuView.Score.textAlignment = .center
            
            // 测试
            stuView.stuId = "网络返回的 Id"
            stuView.classNum.text = "2014210386"
            stuView.name.text = "吴啟弘"
            stuView.AllScore.text = "总分 11"
            stuView.Score.text = "+2"
            
        }
       
    }
    
    func nextOne(){
        
        let topView = view.viewWithTag(viewTag) as! stuScoreView
        //移除动画（will）
        topView.x = -300
        topView.animateToNext {
            topView.curve = "EaseIn"
            topView.animateTo()
        }
         viewTag = viewTag - 1
       
    }
    
    func lastOne(){
        
        let lastView = view.viewWithTag(viewTag+1) as! stuScoreView
        //移入动画（will）
        lastView.x = 0
        lastView.animateToNext {
            lastView.curve = "EaseIn"
            lastView.animateTo()
        }
        viewTag = viewTag + 1
    }
    
    
    
    func nextBtnTap(){
        
        if viewTag > 1002 {
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.nextBtn.frame = CGRect(x:210,y:615,width:160,height:60)
            // 延时
            let time: TimeInterval = 0.2
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.lastBtn.isHidden = false
            }
        }
        }else{
                nextBtn.setTitle("确定", for: .normal)
            }
        
        // 最后一个的提交响应
        guard viewTag != 1001 else{
            
            let alert = UIAlertController(title: "警告", message: "全部打分完毕", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "提交", style: .cancel, handler: nil)
            
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            nextOne()
            return
        }
        
         nextOne()
    }
    
    
    
    func lastBtnTap(){
        
        // 第二个 -> 第一个
        guard viewTag != maxTag-1 else{
            self.lastBtn.isHidden = true
            UIView.animate(withDuration: 0.3) { () -> Void in
                self.nextBtn.frame = CGRect(x:91,y:615,width:232,height:60)
            }
            lastOne()
            return
        }
        
        // 最后一个 -> 倒数第二个
        guard viewTag != 1001 else{
            nextBtn.setTitle("下一个", for: .normal)
            lastOne()
            return
        }

        lastOne()
        print(viewTag)
    }
    
    func postScore(){
        /// 提交分数
        //step1: 获取当前的最上层显示视图 as stuScoreView()
        //step2: 获取视图的 Id 和 分数
        //step3: 网络请求提交分数
    }
    
    func getInfo(){
        
        if self.state == 0 {
         
            //随机抽取
            
        }else{
        
            //单个抽取
            
        }
        
        //step1: 网络请求  ->  type: [("stuId","stuNum")]
        //step2: 放入一个全局数组
        //step3: 在注册视图方法中 同时调用储存 realm 和 对应的全局数组
    }
    
    
    // 跳转
    // navigationbar
    func leftBtnTap(_:UIButton){

        _ = self.navigationController?.popViewController(animated: true)
        
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
