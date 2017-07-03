//
//  PlayLocalVideoCell.swift
//  ZP_Swift
//
//  Created by eims on 2017/6/30.
//  Copyright © 2017年 zp. All rights reserved.
//

import UIKit

struct VideoModel {
    let image: String
    let title: String
    let source: String
}

class PlayLocalVideoCell: UITableViewCell {

    let videoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 3))
    let videoTitleLabel = UILabel(frame: CGRect(x: 0, y: ScreenHeight / 3 - 50, width: ScreenWidth, height: 30))
    let videoSourceLabel = UILabel(frame: CGRect(x: 0, y: ScreenHeight / 3 - 20, width: ScreenWidth, height: 20))
    
    /*
     Public:所有都可以访问
     Internal:自己framework访问（默认）
     Private:私有的
     总的来说，默认就行，不公开就private，写框架的话，就需要public公开接口
     */
    private let videoPlayImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 3))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        steupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //无条件停止执行并打印
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func steupView() {
        videoImageView.contentMode = .scaleToFill
        
        videoPlayImageView.contentMode = .center
        videoPlayImageView.image = UIImage(named: "playBtn.png")
        videoPlayImageView.backgroundColor = .clear
        
        videoTitleLabel.font = UIFont(name: "Zapfino", size: 24)
        videoTitleLabel.textColor = .white
        videoTitleLabel.textAlignment = .center
    
        
        videoSourceLabel.textColor = .gray
        videoSourceLabel.font = UIFont(name: "Avenir Next", size: 14)
        videoSourceLabel.textAlignment = .center
        
        
        contentView.addSubview(videoImageView)
        contentView.addSubview(videoPlayImageView)
        contentView.addSubview(videoTitleLabel)
        contentView.addSubview(videoSourceLabel)
    }
    
    func setVideoModel(model: VideoModel) {
        
        videoImageView.image = UIImage(named: model.image)
        videoTitleLabel.text = model.title
        videoSourceLabel.text = model.source
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
