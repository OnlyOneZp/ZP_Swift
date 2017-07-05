//
//  ViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/29.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .plain)
    
    var dataArray = ["一个简易的，具有“开始，暂停，结束，继续”功能的计时器。熟悉timer的使用",
                     "切换显示字体。主要是熟悉导入字体的方法，熟悉tableview的使用",
                     "播放本地视频。主要是熟悉本地视频的播放，tableview的使用，如何自定义tableviewcell等",
                     "简单的欢迎页实现。主要熟悉UIScrollView、UIPageControl的使用",
                     "简单的浏览图片。主要熟悉UICollectionView的使用，流式布局，自定义UICollectionCell等",
                     "简单的定位。主要是熟悉iPhone定位的使用，位置的解析",
                     "简单的使用系统自带的刷新控件。主要是熟悉系统自带的刷新控件使用",
                     "简单的梯度显示颜色。主要是熟悉怎么显示有梯度的颜色",
                     "利用ScrollView简单的实现图片缩放功能。主要是熟悉怎么使用ScrollView的缩放功能",
                     "利用视频做背景的简单实现。主要是熟悉AVPlayerViewController的使用，以及达到用视频做背景的效果",
                     "简单的实现彩色的进度条。主要是熟悉swift的继承，CALayer动画的实现",
                     "一个TableHeaderView跟随着下拉放大图片，上拉缩小图片功能。主要是利用ScrollView的contentInset属性，实现该效果",
                     "TableViewCell动画。熟悉TableViewCell动画的实现"]
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableviewcell")
        
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell")
        
        cell?.selectionStyle = .none
        
        cell?.textLabel?.text = String(indexPath.row + 1) + "、" + dataArray[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            //一个简易的，具有“开始，暂停，结束，继续”功能的计时器。熟悉timer的使用
            navigationController?.pushViewController(SimpleClockController(), animated: true)
        case 1:
            //切换显示字体。主要是熟悉导入字体的方法，熟悉tableview的使用
            navigationController?.pushViewController(CustomFontController(), animated: true)
        case 2:
            //播放本地视频。主要是熟悉本地视频的播放，tableview的使用，如何自定义tableviewcell等
            navigationController?.pushViewController(PlayLocalVideoController(), animated: true)
        case 3:
            //简单的欢迎页实现。主要熟悉UIScrollView、UIPageControl的使用
            navigationController?.pushViewController(WelcomViewController(), animated: true)
        case 4:
            //简单的浏览图片。主要熟悉UICollectionView的使用，流式布局，自定义UICollectionCell等
            navigationController?.pushViewController(PictureBrowseController(), animated: true)
        case 5:
            //简单的定位。主要是熟悉iPhone定位的使用，位置的解析
            navigationController?.pushViewController(CurrentLocationController(), animated: true)
        case 6:
            //简单的使用系统自带的刷新控件。主要是熟悉系统自带的刷新控件使用
            navigationController?.pushViewController(SystemRefreshController(), animated: true)
        case 7:
            //简单的梯度显示颜色。主要是熟悉怎么显示有梯度的颜色
            navigationController?.pushViewController(GradientColorController(), animated: true)
        case 8:
            //利用ScrollView简单的实现图片缩放功能。主要是熟悉怎么使用ScrollView的缩放功能
            navigationController?.pushViewController(ImageScrollerController(), animated: true)
        case 9:
            //利用视频做背景的简单实现。主要是熟悉AVPlayerViewController的使用，以及达到用视频做背景的效果
            navigationController?.pushViewController(VideoBackgroundController(), animated: true)
        case 10:
            //简单的实现彩色的进度条。主要是熟悉swift的继承，CALayer动画的实现
            navigationController?.pushViewController(ColorProgressController(), animated: true)
        case 11:
            //一个TableHeaderView跟随着下拉放大图片，上拉缩小图片功能。主要是利用ScrollView的contentInset属性，实现该效果
            navigationController?.pushViewController(TableHeaderViewController(), animated: true)
        case 12:
            //TableViewCell动画。熟悉TableViewCell动画的实现
            navigationController?.pushViewController(AnimateTableViewController(), animated: true)
        default:
            break
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

