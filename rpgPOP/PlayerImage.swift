//
//  PlayerImage.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation
import UIKit

class PlayerImg: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func playIdleAnimation(name: String){
        self.image = UIImage(named: "\(name)Idle1.png")
        self.animationImages = nil //to clear the animationImages
        
        var imageArray = [UIImage]()
        for x in 1...6 {
            let img = UIImage(named: "\(name)Idle\(x).png")
            imageArray.append(img!)
        }
        //self is called for the UIImage propierties
        //An array of images to stores the images and start animating
        self.animationImages = imageArray
        //Set de duration of the animation
        self.animationDuration = 0.8
        
        //With 0 is an infinite loop
        self.animationRepeatCount = 0
        self.startAnimating()
        
    }
    
    func playDeathAnimation(name: String) {
        self.image = UIImage(named: "\(name)Dead5.png")
        self.animationImages = nil //to clear the animationImages
        
        var imageArray = [UIImage]()
        for x in 1...4 {
            let img = UIImage(named: "\(name)Dead\(x).png")
            imageArray.append(img!)
        }
        //self is called for the UIImage propierties
        //An array of images to stores the images and start animating
        self.animationImages = imageArray
        //Set de duration of the animation
        self.animationDuration = 0.8
        //With 0 is an infinite loop
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    
    
}