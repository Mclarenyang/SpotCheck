//
//  stuViewController.swift
//  SpotCheck
//
//  Created by nexuslink mac 2 on 2017/6/6.
//  Copyright © 2017年 NMID. All rights reserved.
//

import UIKit

class stuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // 屏幕信息
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    // tableview
    var tableView: UITableView!
    
    var checkNum : UILabel!
    
    var checkView: UIView!
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
        
        //分段控件
        segmentedControl = UISegmentedControl(items: segments)
        segmentedControl.frame = CGRect(x:100,y:25,width:220,height:29)
        segmentedControl.tintColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tag = 404
        segmentedControl.addTarget(self, action: #selector(segmentDidchange(_:)), for: .valueChanged)
        
        self.navigationController?.view.addSubview(segmentedControl)
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
        doneBtn.setBackgroundImage(btnBgImage, for: .normal)
        checkView.addSubview(doneBtn)
        
        checkNum =  UILabel(frame: CGRect(x:120,y:177,width:222,height:403))
        checkNum.text = "5"
        checkNum.textColor = UIColor.white
        checkNum.font = UIFont.systemFont(ofSize: 288)
        checkView.addSubview(checkNum)
        
        self.view.addSubview(checkView)
    }
    
    func pushCheckView(){
        checkView.removeFromSuperview()
    }
    
    // 点击跳转事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 点击行
        NSLog(String(indexPath.row))
        // 跳转传值
        let PostView = postScoreViewController()
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
