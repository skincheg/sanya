//
//  VideoView.swift
//  VideoPreview
//
//  Created by bnkwsr5 on 13.09.2020.
//  Copyright © 2020 bnkwsr5. All rights reserved.
//

import UIKit
import AVKit

class VideoView: UIView {
    
    let playerLayer = AVPlayerLayer()
    let player = AVPlayer()
    let timeLabel = UILabel()
    var _video: String = ""
    public var video: String{
        get{
            return self._video
        }
        set{
            self._video = newValue
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.timeLabel.textAlignment = .right
        self.playerLayer.player = self.player
        self.playerLayer.frame = self.bounds
        self.timeLabel.textColor = .white
        self.layer.addSublayer(self.playerLayer)
        self.timeLabel.frame = .init(x: 0, y: self.frame.height - 40, width: self.frame.width, height: 40)
        self.addSubview(self.timeLabel)
    }
    
    func setTime(){
        let time = self.player.currentItem!.asset.duration
        print(time.seconds)
    
        self.timeLabel.text = ""
    }
    
    func setVideo(url: URL){
        self.video = url.absoluteString
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        self.player.replaceCurrentItem(with: playerItem)
        setTime()
    }
    
}
