//
//  ChildVCTransitionViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/16.
//  Copyright © 2017年 zp. All rights reserved.
//

//转场动画最简单的实现方式。利用ViewController的transition方法，实现VC的子VC之间跳转的转场动画

import UIKit

let JumpNotification = "JumpNotification"


class ChildVCTransitionViewController: UIViewController {

    var currentChildNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupView() {
        addChildViewController(ChildAVC())
        addChildViewController(ChildBVC())
        
        view.addSubview((childViewControllers.first?.view)!)
        
        //监听跳转通知
        NotificationCenter.default.addObserver(self, selector: #selector(jump), name: Notification.Name(JumpNotification), object: nil)
    }
    
    func jump() {
        
        //跳转方式
        transition(from: currentChildNumber == 0 ? childViewControllers.first! : childViewControllers.last!,
                   to: currentChildNumber == 0 ? childViewControllers.last! : childViewControllers.first!,
                   duration: 1,
                   options: currentChildNumber == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight,
                   animations: nil,
                   completion: nil)
        
        currentChildNumber = currentChildNumber == 0 ? 1 : 0
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: JumpNotification), object: nil)
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
