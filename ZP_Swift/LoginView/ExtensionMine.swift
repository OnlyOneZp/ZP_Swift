//
//  Extension.swift
//  ZP_Swift
//
//  Created by eims on 2017/9/11.
//  Copyright © 2017年 zp. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func modificationTextField(placeholder: String, keyboardType: UIKeyboardType, text: String?){
        
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.text = text
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        textAlignment = .center
        clearButtonMode = .whileEditing
    
    }
}


extension UIButton {
    func modificationButton(title: String, BGColor: UIColor = .blue) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = BGColor
        layer.cornerRadius = 5
    }
}


extension Date {
    static func getCurrentTime() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        return format.string(from: date)
    }
}
