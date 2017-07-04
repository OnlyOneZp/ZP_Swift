
//
//  SystemRefreshController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/3.
//  Copyright © 2017年 zp. All rights reserved.
//

//简单的使用系统自带的刷新控件。主要是熟悉系统自带的刷新控件使用
//注：系统自带的刷新控件只能实现下拉

import UIKit

class SystemRefreshController: UIViewController {

    
    let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
    let refreshControl = UIRefreshControl()
    
    var contents = ["1-6-8","2-4-9","2-6-7","3-4-8"]
    
    let news = ["1-9","2-8","3-7","4-6"]
    let reuserId = "refreshcell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        
        //tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()//必要初始化器和指定初始化器
        
        tableview.refreshControl = refreshControl
        refreshControl.backgroundColor = .gray
        refreshControl.attributedTitle = NSAttributedString(string: "最后一次更新：\(NSDate())", attributes: [NSForegroundColorAttributeName: UIColor.white])
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(addContent), for: .valueChanged)
        
        view.addSubview(tableview)
    }

    func addContent() {
        contents.append(contentsOf: news)
        tableview.reloadData()
        refreshControl.endRefreshing()
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

//将代理写到拓展里面
extension SystemRefreshController: UITableViewDelegate, UITableViewDataSource{
    //MARK: - DataSourde
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuserId) ?? UITableViewCell(style: .default, reuseIdentifier: reuserId)
        cell.textLabel?.text = String(indexPath.row + 1) + ":" + contents[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
}
