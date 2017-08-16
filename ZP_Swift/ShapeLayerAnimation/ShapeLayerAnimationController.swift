//
//  ShapeLayerAnimationController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/7.
//  Copyright © 2017年 zp. All rights reserved.
//

//采用UIBezierPath和CAShapeLayer配合，实现动画效果。加深对CAShapeLayer的熟悉，熟悉CABasicAnimation动画的实现

import UIKit

class ShapeLayerAnimationController: UIViewController {

    let btnOne = UIButton(frame: CGRect(x: 100, y: 200, width: ScreenWidth-200, height: 30))
    let btnTwo = UIButton(frame: CGRect(x: 100, y: 300, width: ScreenWidth-200, height: 30))
    
    var drawView = DrawView(frame:CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight-64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        title = "画图与动画"
        view.backgroundColor = UIColor.white
        
        btnOne.setTitle("DrawRect", for: .normal)
        btnOne.setTitleColor(UIColor.orange, for: .normal)
        btnOne.addTarget(self, action: #selector(showView), for: .touchUpInside)
        view.addSubview(btnOne)
        
        
        btnTwo.setTitle("CAShapeLayer", for: .normal)
        btnTwo.setTitleColor(UIColor.orange, for: .normal)
        btnTwo.addTarget(self, action: #selector(showView), for: .touchUpInside)
        view.addSubview(btnTwo)
    }
    
    func showView(_ sender: UIButton) {
        if sender.currentTitle == "DrawRect" {
            print("采用drawrect画图")
            drawView.backgroundColor = UIColor.white
            view.addSubview(drawView)
        }else {
            print("采用cashapelayer")
            navigationController?.pushViewController(ShapeController(), animated: true)
        }
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
