//
//  PictureBrowseController.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/30.
//  Copyright © 2017年 zp. All rights reserved.
//

//简单的浏览图片。主要熟悉UICollectionView的使用，流式布局，自定义UICollectionCell等

import UIKit

let ItemWidth = ScreenWidth - 40
let ItemHeight = ScreenHeight / 3.0

class PictureBrowseController: UIViewController {

    let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
    var collectionView: UICollectionView!
    
    let pictureData = PictureModel.createInterests()
    
    let reuseIdentifier = "pictureCell"
    
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        
        backgroundImageView.image = UIImage(named: "blue")
        
        let collsctionFlowLayout = UICollectionViewFlowLayout()
        //滚动方向-水平
        collsctionFlowLayout.scrollDirection = .horizontal
        
        collsctionFlowLayout.itemSize = CGSize(width: ItemWidth, height: ItemHeight)
        //上下间隔
        collsctionFlowLayout.minimumLineSpacing = 20
        //左右间隔
        collsctionFlowLayout.minimumInteritemSpacing = 20
        //section边界
        collsctionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: (ScreenHeight - ItemHeight) / 2.0 , width: ScreenWidth, height: ItemHeight), collectionViewLayout: collsctionFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PictureCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(visualEffectView)
        view.addSubview(collectionView)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
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


//扩展viewcontroller支出协议
extension PictureBrowseController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PictureCollectionCell
        
        cell.data = pictureData[indexPath.row]
        
        return cell
    }
}
