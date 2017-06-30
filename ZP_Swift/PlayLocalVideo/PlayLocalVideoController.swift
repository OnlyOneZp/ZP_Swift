//
//  PlayLocalVideoController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/29.
//  Copyright © 2017年 zp. All rights reserved.
//

//播放本地视频。主要是熟悉本地视频的播放，tableview的使用，如何自定义tableviewcell等
//注：导入AVKit、AVFoundation

import UIKit

import AVKit
import AVFoundation

class PlayLocalVideoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var playViewController: AVPlayerViewController?
    var playView: AVPlayer?

    var tableview = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .plain)
    
    let reuserId = "playLocalCell"
    
    let dataAry = [VideoModel(image: "videoScreenshot01", title: "title01", source:          "youku-17/02/01"),
                   VideoModel(image: "videoScreenshot02", title: "title02", source: "youku-17/02/01"),
                   VideoModel(image: "videoScreenshot03", title: "title03", source: "youku-17/03/01"),
                   VideoModel(image: "videoScreenshot04", title: "title04", source: "youku-17/04/01"),
                   VideoModel(image: "videoScreenshot05", title: "title05", source: "youku-17/05/01"),
                   VideoModel(image: "videoScreenshot06", title: "title06", source: "youku-17/06/01")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
    }
    
    func initView() {
        
        view.backgroundColor = .white
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(PlayLocalVideoCell.classForCoder(), forCellReuseIdentifier: reuserId)
        
        view.addSubview(tableview)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenHeight / 3.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserId) as! PlayLocalVideoCell
        cell.setVideoModel(model: dataAry[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo()
    }
    
    func playVideo() {
        
        let path = Bundle.main.path(forResource: "emoji_zone", ofType: "mp4")
        
        /*
         guard与if很相似，区别：
         1.guard必须强制有else语句
         2.只有在guard审查条件成立，guard之后代码才会运行
         */
        if path == nil {
            
            print("该文件不存在")
            return
        }
        
        playView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController = AVPlayerViewController()
        playViewController?.player = playView
        
        self.present(playViewController!, animated: true) { 
            self.playView?.play()
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
