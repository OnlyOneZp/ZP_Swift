//
//  LoginViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/11.
//  Copyright © 2017年 zp. All rights reserved.
//

//登录页面。熟悉如何监听键盘show和hidden通知，自定义Log使其在测试时打印输出，发布时不输出，提高app性能

import UIKit

class LoginViewController: UIViewController {

    let passNameField = UITextField(frame: CGRect(x: 20, y: ScreenHeight/2, width: ScreenWidth-40, height: 30))
    let passWordField = UITextField(frame: CGRect(x: 20, y: ScreenHeight/2+30+10, width: ScreenWidth-40, height: 30))
    let loginBtn = UIButton(frame: CGRect(x: 20, y: ScreenHeight/2+(30+10)*2, width: ScreenWidth-40, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //隐藏导航栏
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        
        passNameField.modificationTextField(placeholder: "请输入用户名", keyboardType: .numberPad, text: nil)
        passWordField.modificationTextField(placeholder: "请输入密码", keyboardType: .asciiCapable, text: nil)
        loginBtn.modificationButton(title: "登录")
        loginBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(passNameField)
        view.addSubview(passWordField)
        view.addSubview(loginBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHiden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func btnClick() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func keyboardWillShow(note: NSNotification) {
        
        let keyboardHeight = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        print("键盘高度：\(keyboardHeight)")
        
        if keyboardHeight/2 == -view.frame.origin.y {
            print("无需再次移动")
            return
        }
        
        UIView.animate(withDuration: 1) { 
            self.view.frame = CGRect(x: 0, y: -keyboardHeight/2, width: ScreenWidth, height: ScreenHeight)
        }
        
    }
    
    func keyboardWillHiden(note: NSNotification) {
        
        if view.frame.origin.x == 0 {
            print("无需再次复位")
        }
        
        UIView.animate(withDuration: 1) { 
            self.view.frame = ScreenRect
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
