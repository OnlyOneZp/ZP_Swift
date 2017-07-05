//
//  ColorProgress.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/5.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class ColorProgress: UIView, CAAnimationDelegate {

    let gradientLayer = CAGradientLayer()
    let maskLayer = CALayer()
    var progress: CGFloat = 0.0 {
        didSet {
            changeMaskFrame()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        let whiteBG = CALayer()
        whiteBG.frame = bounds
        whiteBG.cornerRadius = bounds.size.height / 2.0
        whiteBG.borderColor = UIColor.orange.cgColor
        whiteBG.borderWidth = 1.0
        layer.addSublayer(whiteBG)
        
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.size.height / 2.0
        gradientLayer.borderColor = UIColor.orange.cgColor
        gradientLayer.borderWidth = 1.0
        
        var colors = [CGColor]()
        for hue in stride(from: 0, to: 360, by: 5) {
            let color = UIColor(hue: CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
            colors.append(color)
        }
        
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.addSublayer(gradientLayer)
        
        changeMaskFrame()
        maskLayer.cornerRadius = bounds.size.height/2.0
        maskLayer.backgroundColor = UIColor.orange.cgColor
        gradientLayer.mask = maskLayer
        
        performAnimation()
    }
    
    private func changeMaskFrame() {
        maskLayer.frame = CGRect(x: 0.0, y: 0.0, width: progress*bounds.size.width, height: bounds.size.height)
    }
    

    private func performAnimation() {
        var colors = gradientLayer.colors
        let color = colors?.popLast() as! CGColor
        colors?.insert(color, at: 0)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = gradientLayer.colors
        animation.duration = 0.08
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        gradientLayer.add(animation, forKey: "gradient")
        
        gradientLayer.colors = colors
    }
    
    //动画停止后继续动画
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performAnimation()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
