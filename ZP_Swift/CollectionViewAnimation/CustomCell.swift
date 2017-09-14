//
//  CustomCell.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/13.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let imageV = UIImageView(frame: CGRect(x: 0, y: 0, width: CollectionItemWidth, height: CollectionItemHeight))
    let textV = UITextView(frame: CGRect(x: 0, y: CollectionItemHeight-40, width:CollectionItemWidth, height: 40))
    let backBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
    
    //定义一个无参数，无返回值的闭包属性，用于处理button被点击的情况
    var backButtonTapped: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray
        
        imageV.contentMode = .center
        imageV.clipsToBounds = true
        
        textV.font = UIFont.systemFont(ofSize: 14)
        textV.isUserInteractionEnabled = false
        
        backBtn.setImage(UIImage(named: "Back-icon"), for: .normal)
        backBtn.isHidden = true
        backBtn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        
        addSubview(imageV)
        addSubview(textV)
        addSubview(backBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backBtnTouch() {
        backBtn.isHidden = true
        backButtonTapped!()
    }
    
    func handleCellSelected() {
        backBtn.isHidden = false
        superview?.bringSubview(toFront: self)//将自身（CustomCell）显示在最前面
    }
    
    func prepareCell(model: CellModel) {
        imageV.frame = CGRect(x: 0, y: 0, width: CollectionItemWidth, height: CollectionItemHeight)
        textV.frame = CGRect(x: 0, y: CollectionItemHeight-40, width:CollectionItemWidth, height: 40)
        imageV.image = UIImage(named: model.imageName)
        textV.text = model.title
    }
}
