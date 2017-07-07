
//
//  AnimateTableViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/5.
//  Copyright © 2017年 zp. All rights reserved.
//

//TableViewCell动画。熟悉TableViewCell动画的实现

import UIKit

class AnimateTableViewController: UIViewController {

    let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .plain)
    let reuserCellId = "animateTableviewCell"
    
    let dataAry = ["下","拉","可","以","出","现","很","神","奇","的","事","情"]
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = .white
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.showsVerticalScrollIndicator = false
        
        view.addSubview(tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateTable() {
        tableview.reloadData()
        //所有可见的cell
        let cells = tableview.visibleCells
        let tableHeight = tableview.bounds.size.height
        
        for (index,cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0,
                           delay: 0.05*Double(index),
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                },
                           completion: nil)
        }
    }

    func colorforIndex(index: Int) -> UIColor {
        let itemCount = dataAry.count-1
        let color = (CGFloat(index)/CGFloat(itemCount))*0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
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

extension AnimateTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuserCellId) ?? AnimateTableViewCell(style: .default, reuseIdentifier: reuserCellId)
        
        cell.textLabel?.text = dataAry[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorforIndex(index: indexPath.row)
    }
}
