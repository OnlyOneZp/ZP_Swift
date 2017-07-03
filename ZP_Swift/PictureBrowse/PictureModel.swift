//
//  PictureModel.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/3.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

class PictureModel: NSObject {
    
    var title: String?
    var descriptions: String?
    var featuredImage: UIImage?
    
    init(title: String, descriptions: String, featuredImage: UIImage) {
        self.title = title
        self.descriptions = descriptions
        self.featuredImage = featuredImage
        
    }
    
    static func createInterests() -> [PictureModel] {
        return [
            PictureModel(title: "Hello there, i miss u.", descriptions: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            PictureModel(title: "🐳🐳🐳🐳🐳", descriptions: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            PictureModel(title: "Training like this, #bodyline", descriptions: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            PictureModel(title: "I'm hungry, indeed.", descriptions: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            PictureModel(title: "Dark Varder, #emoji", descriptions: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            PictureModel(title: "I have no idea, bitch", descriptions: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }
    
}
