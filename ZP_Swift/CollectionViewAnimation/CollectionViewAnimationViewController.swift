//
//  CollectionViewAnimationViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/13.
//  Copyright © 2017年 zp. All rights reserved.
//

//集合视图动画。熟悉CollectionView使用，自定义cell，闭包使用，结构体自定义等

import UIKit

let CollectionItemHeight = ScreenHeight/3-20.0
let CollectionItemWidth = ScreenWidth-20.0

class CollectionViewAnimationViewController: UIViewController {

    var collectionView: UICollectionView!
    var datas = CellModel.getData()
    let reuseIdentifier = String(describing: CustomCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func setupView() {
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical//设置滚动方向
        collectionLayout.itemSize = CGSize(width: CollectionItemWidth, height: CollectionItemHeight)//设置cell大小
        collectionLayout.minimumLineSpacing = 10//上下间隔
        collectionLayout.minimumInteritemSpacing = 10//左右间隔
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)//设置section边界
        
        collectionView = UICollectionView(frame: ScreenRect, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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

//MARK: - extension
extension CollectionViewAnimationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (datas?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        cell.prepareCell(model: (datas![indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !collectionView.isScrollEnabled {
            return
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
            else {
            return
        }
     
        collectionView.isScrollEnabled = false
        cell.handleCellSelected()
        cell.backButtonTapped = {
            
            print("闭包执行")
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: [indexPath])
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: { 
                        
                        cell.frame = CGRect(x: 10, y: self.collectionView.contentOffset.y + 60, width: ScreenWidth-20, height: ScreenHeight)
                        cell.imageV.frame = cell.bounds
                        cell.textV.frame = CGRect(x: 0, y: ScreenHeight-60-60, width: ScreenWidth-20, height: 60)
                        
            }) { (finish) in
                print("动画结束")
        }
    }
    
}

//MARK: - 数据结构体
struct CellModel {
    
    let imageName: String
    let title: String
    
    init(imageName: String?, title: String?) {
        self.imageName = imageName ?? ""
        self.title = title ?? "没有title"
    }
    
    static func getData() -> [CellModel]? {
        
        let text = "In a storyboard-based application, you will often want to do a little preparation before navigation."
        let imagenames = ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05"]
        let titles = Array(repeating: text, count: 5)
        var result = [CellModel]()
        for (index, name) in imagenames.enumerated() {
            result.append(CellModel(imageName: name, title: titles[index]))
        }
        
        return result
        
    }
}

