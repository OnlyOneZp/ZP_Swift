//
//  ColorProgressController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/5.
//  Copyright © 2017年 zp. All rights reserved.
//

//简单的实现彩色的进度条。主要是熟悉swift的继承，CALayer动画的实现

import UIKit

class ColorProgressController: UIViewController {

    let colorProgress = ColorProgress(frame: CGRect(x: 20, y: 200, width: ScreenWidth-40, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(colorProgress)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            
            self.colorProgress.progress += 0.08
            if self.colorProgress.progress >= 1.0 {
                timer.invalidate()
            }
        }
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
