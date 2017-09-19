//
//  SortableCollectionViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/14.
//  Copyright © 2017年 zp. All rights reserved.
//

//可拖动的CollectionViewCell。没有利用iOS9系统提供的方法，该实现方式适用用iOS8以上系统。熟悉协议、代理的使用

import UIKit

class SortableCollectionViewController: UIViewController {

    var collectionView: SortableCollectionView!
    var timer: Timer?
    let reuseIdentifier = String(describing: UICollectionViewCell.self)
    
    var data = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        //生成41个cell
        for _ in 0...40 {
            
            data.append(UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0))
        }
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical//滚动方向
        collectionLayout.itemSize = CGSize(width: (ScreenWidth-40)/3, height: (ScreenWidth-40)/3)//cell大小
        collectionLayout.minimumLineSpacing = 5//上下间隔
        collectionLayout.minimumInteritemSpacing = 5//左右间隔
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)//section边界
        
        collectionView = SortableCollectionView(frame: ScreenRect, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.sortableDelegate = self;
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
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

extension SortableCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, SortableCollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = data[indexPath.row]
        return cell
    }
    
    //改变数据
    func exchangeDataSource(fromIndex: IndexPath, toIndex: IndexPath) {
        let temp = data[fromIndex.row]
        data[fromIndex.row] = data[fromIndex.row]
        data[toIndex.row] = temp
    }
    
    //开始拖动
    func beginDragAndInitDragCell(collectionView: SortableCollectionView, dragCell: UIView) {
        dragCell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        dragCell.backgroundColor = UIColor.lightGray
    }
    //拖动结束
    func endDragAndResetDragCell(collectionView: SortableCollectionView, dragCell: UIView) {
        dragCell.transform = CGAffineTransform(scaleX: 1, y: 1)
        dragCell.backgroundColor = UIColor.white
    }
}
