//
//  AnimatedSplashViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/16.
//  Copyright © 2017年 zp. All rights reserved.
//

//关键帧动画实现类似twitter加载首页效果。熟悉关键帧动画CAKeyframeAnimation的使用

import UIKit

class AnimatedSplashViewController: UIViewController, CAAnimationDelegate {

    let mask = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        mask.contents = UIImage(named: "twitter")?.cgImage//这里需要是CGImage
        mask.contentsGravity = "resizeAspect"//图片显示风格
        mask.bounds = CGRect(x: 0, y: 0, width: 123, height: 100)//边界
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)//锚点
        mask.position = CGPoint(x: ScreenWidth/2, y: ScreenHeight/2)//位置
        view.layer.mask = mask
        //view.backgroundColor = UIColor(red: 31/255.0, green: 150/255.0, blue: 1, alpha: 1)
        
        animateMask()
    }

    func animateMask() {
        /*keyframe与basic区别：
         1.basic只能从一个数值到另一个数值
         2.keyframe使用一个nsarray保存这些值
         3.basic可以看做只有2个关键帧的keyframe关键帧动画
         */
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let firstBounds = NSValue(cgRect: mask.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 369, height: 300))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1230, height: 1000))
        keyFrameAnimation.values = [firstBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.8, 1]
        mask.add(keyFrameAnimation, forKey: "bounds")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        view.layer.mask = nil
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
