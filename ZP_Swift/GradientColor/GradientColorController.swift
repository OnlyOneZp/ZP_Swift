//
//  GradientColorController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/4.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class GradientColorController: UIViewController {

    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }

    func setupView() {
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1,color2,color3,color4,color5]
        gradientLayer.locations = [0.10,0.20,0.50,0.70,0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.addSublayer(gradientLayer)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
    }
    
    func randomColor() {
        
        view.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
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
