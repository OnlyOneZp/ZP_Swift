//
//  CustomPushTransitionViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/21.
//  Copyright © 2017年 zp. All rights reserved.
//

//实现push、pop动画。该转场动画的实现方式比较适合用导航栏push、pop的时候用，UITabbarController等也适合

import UIKit

class CustomPushTransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //view.layer.contents = UIImage(named: "blue")?.cgImage
        view.backgroundColor = UIColor.red
        
        //隐藏导航栏
        //navigationController?.navigationBar.isHidden = true
        
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        btn.center = CGPoint(x: ScreenWidth/2, y: ScreenHeight/2)
        btn.backgroundColor = UIColor.white
        btn.setTitle("CustomPushTransitionVC", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //设置自己成为导航栏的代理，同样可以用在别的controller的代理
        navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClick() {
        navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //navigationController?.pushViewController(PushViewController(), animated: true)
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

extension CustomPushTransitionViewController: UINavigationControllerDelegate{
    
    //返回转场动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PushAnimation()
        }else {
            return nil
        }
    }
}
