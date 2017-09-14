//
//  SwipeableCellViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/14.
//  Copyright © 2017年 zp. All rights reserved.
//

//TableView左划出现操作菜单功能。熟悉实现方式，AlertControl的使用等

import UIKit

class SwipeableCellViewController: UIViewController {

    var datas = [SwipeableModel]()
    let tableview = UITableView(frame: ScreenRect, style: .plain)
    let reuseIdentifer: String = "SwipeableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupData()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupData() {
        
        for index in 0...20 {
            datas.append(SwipeableModel(imageName: "Chat", title: "第\(index + 1)行"))
        }
    }
    
    func setupView() {
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifer)
        view.addSubview(tableview)
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

extension SwipeableCellViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath)
        
        cell.imageView?.image = UIImage(named: datas[indexPath.row].imageName)
        cell.textLabel?.text = datas[indexPath.row].title
        
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //实现该方法，并返回数据，就会开启cell的左划功能
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //MARK: - 删除
        let delete = UITableViewRowAction(style: .normal, title: "删除") { (action, indexPath) in
            
            let alert = UIAlertController(title: "是否删除？", message: "删除了就没有了呦！", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                
                tableView.reloadRows(at: [indexPath], with: .fade)
            })
            let delete = UIAlertAction(title: "确定", style: .destructive, handler: { (action) in
                
                self.datas.remove(at: indexPath.row)
                tableView.reloadRows(at: [indexPath], with: .fade)
            })
            alert.addAction(cancel)
            alert.addAction(delete)
            self.present(alert, animated: true, completion: nil)
        }
        delete.backgroundColor = UIColor.red
        
        //MARK: - 分享
        let share = UITableViewRowAction(style: .normal, title: "分享") { (action, indexPath) in
            
            let firstItem = self.datas[indexPath.row]
            let activityVC = UIActivityViewController(activityItems: [firstItem.title], applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: { 
                tableView.reloadRows(at: [indexPath], with: .fade)
            })
        }
        share.backgroundColor = UIColor.orange
        
        //MARK: - 编辑
        let edit = UITableViewRowAction(style: .normal, title: "编辑") { (action, indexPath) in
            
            let alert = UIAlertController(title: "修改名称", message: "随便改", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                
                tableView.reloadRows(at: [indexPath], with: .fade)
            })
            let change = UIAlertAction(title: "确定", style: .destructive, handler: { (action) in
                
                self.datas[indexPath.row].title = (alert.textFields?.first?.text)!
                tableView.reloadRows(at: [indexPath], with: .fade)
            })
            alert.addTextField(configurationHandler: { (textField) in
                
                textField.placeholder = ""
                textField.text = self.datas[indexPath.row].title
                textField.clearButtonMode = .whileEditing
            })
            alert.addAction(cancel)
            alert.addAction(change)
            self.present(alert, animated: true, completion: nil)
        }
        edit.backgroundColor = UIColor.blue
        
        return [delete,share,edit]
    }
}

struct SwipeableModel {
    
    let imageName: String
    var title: String
    
    
}
