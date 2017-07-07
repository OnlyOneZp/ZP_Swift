//
//  WaveViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/6.
//  Copyright © 2017年 zp. All rights reserved.
//

//波浪形的动画。熟悉CAShapeLayer、CADisplayLink的使用

import UIKit

class WaveViewController: UIViewController {
    
    let waveview = WaveView(frame: CGRect(x: 0.0, y: 200.0, width: ScreenWidth, height: 31))
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        view.backgroundColor = UIColor.white
        
        waveview.waveSpeed = 10
        waveview.angularSpeed = 1.5
        view.addSubview(waveview)
        
        let whiteView = UIView(frame: CGRect(x: 0.0, y: 230.0, width: ScreenWidth, height: ScreenHeight - 230))
        whiteView.backgroundColor = UIColor.black
        view.addSubview(whiteView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: ScreenWidth - 200, height: 30))
        button.setTitle("开始", for: .normal)
        button.setTitle("暂停", for: .selected)
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(changeStatus(sender:)) , for: .touchUpInside)
        view.addSubview(button)
    }
    
    func changeStatus(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? waveview.startWave() : waveview.stopWave()
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
