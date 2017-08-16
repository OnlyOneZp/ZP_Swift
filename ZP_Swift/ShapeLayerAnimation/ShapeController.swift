//
//  ShapeController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/17.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class ShapeController: UIViewController ,CAAnimationDelegate {
    
    let centerX: Double = 200.0
    let centerY: Double = 300.0
    
    
    private let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ShapeLayer动画"
        
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }

    private func setupView() {
        
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 20.0 //线条宽度
        shapeLayer.lineCap = "round" //线条风格
        shapeLayer.lineJoin = "round" //连接风格
        shapeLayer.strokeColor = UIColor.red.cgColor //相当于线条颜色
        view.layer.addSublayer(shapeLayer)
        
        
        //贝塞尔曲线
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: 80, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: false)
        //关联layer和贝塞尔曲线
        shapeLayer.path = path.cgPath
        //创建动画，strokeEnd属性
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        shapeLayer.autoreverses = false
        animation.duration = 3.0
        
        //设置动画
        shapeLayer.add(animation, forKey: nil)
        animation.delegate = self
        
        //外围16根线条
        let count = 16
        for index in 0..<count {
            let line = CAShapeLayer()
            line.fillColor = UIColor.clear.cgColor
            line.strokeColor = UIColor.yellow.cgColor
            line.lineWidth = 15.0
            line.lineCap = "round"
            line.lineJoin = "round"
            view.layer.addSublayer(line)
            
            let linePath = UIBezierPath()
            let pathX = centerX+100*cos(2.0*Double(index)*M_PI/Double(count))
            let patnY = centerY-100*sin(2.0*Double(index)*M_PI/Double(count))
            
            let length = 50
            linePath.move(to: CGPoint(x: pathX, y: patnY))
            linePath.addLine(to: CGPoint(x: pathX+Double(length)*cos(2*M_PI/Double(count)*Double(index)), y: patnY-Double(length)*sin(2*M_PI/Double(count)*Double(index))))
            line.path = linePath.cgPath
            line.add(animation, forKey: nil)
            
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //结束后设置整个填充为红色
        shapeLayer.fillColor = UIColor.red.cgColor
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
