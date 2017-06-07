//
//  stuViewController.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/6.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit
import NumberMorphView

class stuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // 屏幕信息
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    // tableview
    var tableView: UITableView!
    
    // 随机选择学生的view
    var checkView: UIView!
    var checkNum : UILabel!
    var Mycheck = NumberMorphView()
    
    var stuNnm : String!
    
    
    var leftbtn = UIButton()
    //分段控件
    let segments = ["学生表","抽取"]
    var segmentedControl = UISegmentedControl()
    
    let anm :[(String,String)] = [("大象","2014210344"),("兔子","2014210344"),("松鼠","2014210344"),("河豚","2014210344"),("袋鼠","2014210344"),("袋熊","2014210344")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 设置tableview
        self.tableView = UITableView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight))
        self.tableView.tableHeaderView?.isHidden = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        // 返回
        self.navigationItem.hidesBackButton = true
        leftbtn = UIButton(frame: CGRect(x:0,y:0,width:80,height:50))
        leftbtn.setTitle("<", for: .normal)
        leftbtn.setTitleColor(UIColor.white, for: .normal)
        leftbtn.addTarget(self, action: #selector(leftBtnTap(_:)), for: UIControlEvents.touchUpInside)
        let item = UIBarButtonItem(customView: leftbtn)
        self.navigationItem.leftBarButtonItem = item
        
        // 分段控件
        segmentedControl = UISegmentedControl(items: segments)
        segmentedControl.frame = CGRect(x:100,y:25,width:220,height:29)
        segmentedControl.tintColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tag = 404
        segmentedControl.addTarget(self, action: #selector(segmentDidchange(_:)), for: .valueChanged)
        
        self.navigationItem.titleView = segmentedControl
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableview行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenHeight/10
    }
    
    // tableview行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anm.count
    }
    
    // tableview 加载cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /// 定义cell
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellId")
        // 读取数据
        let name = anm[indexPath.row].0
        let time = anm[indexPath.row].1
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = time
        
        return cell
    }
    
    /// 分段控件
    func segmentDidchange(_ segmented:UISegmentedControl){

        if segmented.selectedSegmentIndex == 0 {
            pushCheckView()
        }
        else{
            loadCheckView()
        }

    }
    
    
    func loadCheckView(){
        checkView = UIView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight))
        checkView.tag = 555
        let bgImage = UIImage(named:"checkByNum.png")
        checkView.backgroundColor = UIColor(patternImage: bgImage!)
        
        let doneBtn = UIButton(frame: CGRect(x:104,y:565,width:207,height:57))
        let btnBgImage = UIImage(named:"done.png")
        doneBtn.addTarget(self, action: #selector(doneBtnTap(_:)), for: .touchUpInside)
        doneBtn.setBackgroundImage(btnBgImage, for: .normal)
        checkView.addSubview(doneBtn)
        
        Mycheck.frame = CGRect(x:80,y:177,width:250,height:403)
        Mycheck.lineWidth = 10
        Mycheck.animationDuration = 0.2
        Mycheck.interpolator = NumberMorphView.OvershootInterpolator()
        Mycheck.fontColor = UIColor.white
        self.stuNnm = String(arc4random_uniform(7)+1)
        Mycheck.currentDigit = Int(self.stuNnm)!
        checkView.addSubview(Mycheck)
        
        // 手势
        // 上滑
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUpGesture)
       
        
        // 下滑
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDownGesture)
        
        
        self.view.addSubview(checkView)
    }
    
    
    func pushCheckView(){
        checkView.removeFromSuperview()
    }
    
    // 滑动手势触发
    func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch  direction {
//        case UISwipeGestureRecognizerDirection.left:
//            break
//        case UISwipeGestureRecognizerDirection.right:
//            break
        case UISwipeGestureRecognizerDirection.up:
            if Int(self.stuNnm)! + 1 <= 9 {
                Mycheck.nextDigit = Int(self.stuNnm)! + 1
                self.stuNnm = String(Int(self.stuNnm)! + 1)
            }
            else{
                let alert = UIAlertController(title: "警告", message: "超出抽取范围", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "返回", style: .cancel, handler: nil)
                
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }
            break
        case UISwipeGestureRecognizerDirection.down:
            if Int(self.stuNnm)! - 1 >= 1 {
                Mycheck.nextDigit = Int(self.stuNnm)! - 1
            self.stuNnm = String(Int(self.stuNnm)! - 1)
            }else{
                let alert = UIAlertController(title: "警告", message: "低于抽取范围", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "返回", style: .cancel, handler: nil)
                
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }
            break
        default:
            break
        }
    }
    
    // 点击跳转事件
    // table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 点击行
        NSLog(String(indexPath.row))
        // 跳转传值
        let PostView = postScoreViewController()
        PostView.stuNum = 1
        PostView.viewTag = 1001
        self.navigationController?.pushViewController(PostView, animated: true)

    }
    
    // navigationbar
    func leftBtnTap(_:UIButton){
        
        _ = self.navigationController?.popViewController(animated: true)
        self.segmentedControl.isHidden = true
    }
    
    // 随机
    func doneBtnTap(_:UIButton){
        
        let PostView = postScoreViewController()
        PostView.stuNum = Int(self.stuNnm)!
        PostView.viewTag = 1000 + Int(self.stuNnm)!
        self.navigationController?.pushViewController(PostView, animated: true)
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
