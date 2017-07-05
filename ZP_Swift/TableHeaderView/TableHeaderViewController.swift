//
//  TableHeaderViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/5.
//  Copyright © 2017年 zp. All rights reserved.
//

//一个TableHeaderView跟随着下拉放大图片，上拉缩小图片功能。主要是利用ScrollView的contentInset属性，实现该效果

import UIKit

let HeadViewHeight = ScreenHeight / 3.0

class TableHeaderViewController: UIViewController {

    let data = ["下","拉","可","以","出","现","很","神","奇","的","事","情"]
    
    let tableview = UITableView(frame: CGRect(x: 0, y: 60, width: ScreenWidth, height: ScreenHeight), style: .plain)
    let reuserCellId = "tableviewcell"
    
    
    let headView = UIImageView(frame: CGRect(x: 0.0, y: 60.0, width: ScreenWidth, height: HeadViewHeight))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        headView.backgroundColor = .white
        headView.contentMode = .scaleAspectFill
        
        /*
         clipsToBounds-是指视图上的子视图,如果超出父视图的部分就截取掉,
         masksToBounds-却是指视图的图层上的子图层,如果超出父图层的部分就截取掉
         */
        headView.clipsToBounds = true
        view.addSubview(headView)
        
        //加载图片
        /*注：iOS9，新特性要求 App 内访问的网络必须使用HTTPS协议
         解决方法：1.在 Info.plist 中添加NSAppTransportSecurity类型Dictionary。
                 2.在NSAppTransportSecurity下添加NSAllowsArbitraryLoads类型Boolean, 值设为YES
        */
        let url = URL(string: "http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let _ = data,error == nil else { return }
            //回到主线程
            DispatchQueue.main.sync {
                self.headView.image = UIImage(data: data!)
            }
        }
        task.resume()
        
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.showsVerticalScrollIndicator = false
        
        //下面两句必不可少，否则会出现第一次加载时位置不对的情况
        tableview.contentInset.top = HeadViewHeight
        tableview.contentOffset = CGPoint(x: 0.0, y: -HeadViewHeight)
        
        view.addSubview(tableview)
        view.sendSubview(toBack: tableview)
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

extension TableHeaderViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuserCellId) ?? UITableViewCell(style: .default, reuseIdentifier: reuserCellId)
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    //MARK - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsety = scrollView.contentOffset.y + scrollView.contentInset.top
        
        if offsety <= 0 {
            headView.frame = CGRect(x: 0.0, y: 60.0, width: ScreenWidth, height: HeadViewHeight - offsety)
        }else{
            let height = (HeadViewHeight-offsety) <= 0.0 ? 0.0 : (HeadViewHeight-offsety)
            headView.frame = CGRect(x: 0, y: 60, width: ScreenWidth, height: height)
            headView.alpha = height / HeadViewHeight
        }
        
    }
}
