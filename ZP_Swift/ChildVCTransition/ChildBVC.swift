//
//  ChildBVC.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/16.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class ChildBVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        
        //添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapJump))
        view.addGestureRecognizer(tap)
        
    }
    
    func tapJump() {
        //发送跳转通知
        NotificationCenter.default.post(name: Notification.Name(JumpNotification), object: nil)
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
