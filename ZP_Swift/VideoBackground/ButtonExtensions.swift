//
//  ButtonExtensions.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/5.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    func customBtn(customTitle: String) {
        setTitle(customTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}
