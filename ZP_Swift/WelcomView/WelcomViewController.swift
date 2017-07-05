//
//  WelcomViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/30.
//  Copyright © 2017年 zp. All rights reserved.
//

//简单的欢迎页实现。主要熟悉UIScrollView、UIPageControl的使用

import UIKit

class WelcomViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
    
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: ScreenHeight - 40, width: ScreenWidth, height: 20))
    
    let imagesAry = ["first","second","three"]
    
    var currentPage = 0
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //隐藏导航栏
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        
        //遍历数组
        for (index,value) in imagesAry.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: ScreenWidth * CGFloat(index), y: 0, width: ScreenWidth, height: ScreenHeight))
            imageView.image = UIImage(named: value)
            
            //限制边界
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleToFill
            
            scrollView.addSubview(imageView)
            
            if index == imagesAry.count - 1 {
                let button = UIButton(frame: CGRect(x: ScreenWidth * CGFloat(index) + ScreenWidth / 3, y: ScreenHeight - 50 - 50, width: ScreenWidth / 3, height: 44))
                button.customBtn(customTitle: "立即体验")
                
                button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
                
                scrollView.addSubview(button)
            }
            
        }
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: ScreenWidth * CGFloat(imagesAry.count), height: ScreenHeight)
        
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = imagesAry.count
        pageControl.isEnabled = false
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //由于swift是类型安全的，所以通过逻辑比较时，需要两边的类型相同，不同需要转换一下类型
        let number = Int(round(scrollView.contentOffset.x / ScreenWidth))
        
        if number >= 0 && number <= imagesAry.count - 1 && number != currentPage {
            currentPage = number
            pageControl.currentPage = currentPage
        }
    }

    //立即体验按钮响应
    func buttonClick() {
        
        _ = navigationController?.popViewController(animated: true)
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
