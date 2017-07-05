//
//  VideoBackgroundController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/4.
//  Copyright © 2017年 zp. All rights reserved.
//

//利用视频做背景的简单实现。主要是熟悉AVPlayerViewController的使用，以及达到用视频做背景的效果

//导入框架AVKit、MediaPlayer
import UIKit
import AVKit
import MediaPlayer

class VideoBackgroundController: UIViewController {

    let playerVC = AVPlayerViewController()
    
    let loginButton = UIButton(frame: CGRect(x: 30, y: ScreenHeight-150, width: ScreenWidth-60, height: 50))
    let regisButton = UIButton(frame: CGRect(x: 30, y: ScreenHeight-75, width: ScreenWidth-60, height: 50))
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        setMoviePlayer()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        loginButton.customBtn(customTitle: "登录")
        regisButton.customBtn(customTitle: "注册")
        
        loginButton.addTarget(self, action: #selector(buttonTap(sender:)), for: .touchUpInside)
        regisButton.addTarget(self, action: #selector(buttonTap(sender:)), for: .touchUpInside)
        
        view.addSubview(loginButton)
        view.addSubview(regisButton)
    }
    
    func buttonTap(sender: UIButton) {
        print("点击的按钮："+sender.currentTitle!)
        
        //返回
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setMoviePlayer() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        //指定播放源
        playerVC.player = AVPlayer(url: url)
        //隐藏播放工具
        playerVC.showsPlaybackControls = false
        //播放画面适应方式
        playerVC.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerVC.view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        playerVC.view.alpha = 0
        
        //监听视频播放完的状态
        NotificationCenter.default.addObserver(self, selector: #selector(repeatPlay), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerVC.player?.currentItem)
        
        view.addSubview(playerVC.view)
        //放到最底层
        view.sendSubview(toBack: playerVC.view)
        UIView.animate(withDuration: 1.0) { 
            self.playerVC.view.alpha = 1
            self.playerVC.player?.play()
        }
    }
    
    //回到起点，重新播放
    func repeatPlay() {
        playerVC.player?.seek(to: kCMTimeZero)
        playerVC.player?.play()
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
