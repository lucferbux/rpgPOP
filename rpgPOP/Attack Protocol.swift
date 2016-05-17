//
//  Attack Protocol.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

protocol Attack {
    
}

extension Character where Self: Attack {
    func attack() -> Int {
        return Int(arc4random_uniform(UInt32(strength)))
    }
}