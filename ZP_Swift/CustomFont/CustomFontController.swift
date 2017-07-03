//
//  CustomFontController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/29.
//  Copyright © 2017年 zp. All rights reserved.
//

//切换显示字体。主要是熟悉导入字体的方法，熟悉tableview的使用。

import UIKit

class CustomFontController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let tableview = UITableView(frame: CGRect(x: 0.0, y: 0.0, width: ScreenWidth, height: ScreenHeight*2/3), style: .plain)
    let button = UIButton(frame: CGRect(x: 0.0, y: ScreenHeight*2/3, width: ScreenWidth, height: ScreenHeight/3))
    
    let datas = ["点击一下改变字体，","字体就会改变，","你相信不，","不相信么，","点一下试试吧😊！"]
    
    /*
     字体样式是由外界导入的；
     导入后必须在info.plist文件声明一下 Fonts provided by application
     */
    let fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Heiti SC"]
    var fontNumber = 0
    
    let reuserId = "custom"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
    }
    
    func initView() {
        
        view.backgroundColor = .white
        
        tableview.delegate = self
        tableview.dataSource = self

        button.setTitle("点击更换字体", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .yellow
        button .addTarget(self, action: #selector(changeTextFountName), for: .touchUpInside)
        
        
        view.addSubview(tableview)
        view.addSubview(button)

    }

    func changeTextFountName() {
        fontNumber += 1
        fontNumber = fontNumber % fontNames.count
        
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenHeight*2.0/3.0/CGFloat(datas.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuserId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuserId)
        
        cell.textLabel?.text = datas[indexPath.row]
        cell.textLabel?.font = UIFont.init(name: fontNames[fontNumber], size: 24.0)
        
        return cell
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
