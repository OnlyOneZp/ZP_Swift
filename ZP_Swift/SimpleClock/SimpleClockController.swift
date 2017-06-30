//
//  SimpleClockController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/29.
//  Copyright © 2017年 zp. All rights reserved.
//

//一个简易的，具有“开始，暂停，结束，继续”功能的计时器。熟悉timer的使用。

import UIKit

class SimpleClockController: UIViewController {

    let timeTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 2))
    
    let leftButton = UIButton(frame: CGRect(x: 0, y: ScreenHeight / 2, width: ScreenWidth / 2, height: ScreenHeight / 2))
    
    let rightButton = UIButton(frame: CGRect(x: ScreenWidth / 2, y: ScreenHeight / 2, width: ScreenWidth / 2, height: ScreenHeight / 2))
    
    var timer :Timer?
    
    var num = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        initVIew()
        
        
    }
    
    func initVIew() {
        
        timeTextLabel.backgroundColor = .yellow
        timeTextLabel.text = "0"
        timeTextLabel.textAlignment = .center
        timeTextLabel.textColor = .white
        timeTextLabel.font = UIFont.systemFont(ofSize: ScreenHeight / 4, weight: ScreenWidth / 4)
        
        
        leftButton.backgroundColor = .red
        leftButton.setTitle("开始", for: .normal)
        leftButton.setTitle("停止", for: .selected)
        leftButton.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 40.0)
        
        
        
        rightButton.backgroundColor = .green
        rightButton.setTitle("暂停", for: .normal)
        rightButton.setTitle("继续", for: .selected)
        rightButton.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 40.0)
        
        view.addSubview(timeTextLabel)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }
    
    func buttonClick(sender: UIButton){
     
        switch sender {
            
        case leftButton:
            leftButton.isSelected = !leftButton.isSelected
            leftButton.isSelected ? timerStart() : timerStop()
        
        case rightButton:
            rightButton.isSelected = !rightButton.isSelected
            rightButton.isSelected ? timerPause() : timerContin()
            
        default:
            break
        }
    }
    
    //开始
    func timerStart() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeTimeTextLabel), userInfo: nil, repeats: true)
    }
    
    //停止
    func timerStop() {
        timer?.invalidate()
        
        timeTextLabel.text = "0"
        num = 0
        
        rightButton.isSelected = false
    }
    //暂停
    func timerPause() {
        if !leftButton.isSelected {
            return
        }
        timer?.invalidate()
    }
    
    //继续
    func timerContin() {
        if !leftButton.isSelected {
            return
        }
        timerStart()
    }

    func changeTimeTextLabel() {
        num += 1
        
        timeTextLabel.text = String(num)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
