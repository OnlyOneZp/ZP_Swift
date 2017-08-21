//
//  PushAnimation.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/21.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class PushAnimation: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {

    var transitionContext: UIViewControllerContextTransitioning?
    
    //转场时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    //转场动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //该参数包含了控制转场动画的必要信息
        self.transitionContext = transitionContext
        //目标VC
        let toVC = transitionContext.viewController(forKey: .to)
        //当前VC
        let fromVC = transitionContext.viewController(forKey: .from)
        //容器View，转场动画都是在该容器中进行的，导航控制的wrapper view就是该容器
        let containerView = transitionContext.containerView
        containerView.addSubview((fromVC?.view)!)
        containerView.addSubview((toVC?.view)!)
        
        let startPath = UIBezierPath(rect: CGRect(x: 0, y: ScreenHeight*0.5-2, width: ScreenWidth, height: 4))
        let finalPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        let maskLayer = CAShapeLayer()
        maskLayer.path = finalPath.cgPath
        toVC?.view.layer.mask = maskLayer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startPath.cgPath
        animation.toValue = finalPath.cgPath
        animation.duration = transitionDuration(using: transitionContext)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.delegate = self
        maskLayer.add(animation, forKey: "path")
        
    }
    
    //动画结束
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //通知transition完成，该方法一定要调用(注意"!"符号)
        transitionContext?.completeTransition(!(transitionContext?.transitionWasCancelled)!)
        //清除fromVC的mask
        transitionContext?.viewController(forKey: .from)?.view.layer.mask = nil
        transitionContext?.viewController(forKey: .to)?.view.layer.mask = nil
    }
}
