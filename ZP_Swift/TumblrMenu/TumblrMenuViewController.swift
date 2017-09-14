//
//  TumblrMenuViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/21.
//  Copyright © 2017年 zp. All rights reserved.
//

//模态视图的呈现。熟悉了模态视图的呈现方法，呈现模态视图自定义转场动画，修改系统按钮图标、标题位置的方法

import UIKit

class TumblrMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.layer.contents = UIImage(named: "tree.jpg")?.cgImage
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        btn.center = CGPoint(x: ScreenWidth/2, y: ScreenHeight/2)
        btn.backgroundColor = UIColor.white
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
    }

    //隐藏导航栏
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClick() {
       let _ = navigationController?.popViewController(animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(MenuViewController(), animated: true, completion: nil)
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
