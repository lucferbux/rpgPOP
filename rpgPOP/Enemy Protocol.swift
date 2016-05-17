//
//  Enemy Protocol.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

protocol Enemy {
    var classEnemy:String {get}
    var weapon:CharStat.Enemy.Weapon {get}
    var armor:CharStat.Enemy.Armor {get}
    var loot:[String] {get}
}

extension Character where Self: Enemy {
    func dropLoot() -> String? {
        
        if !isAlive{
            let rand = Int(arc4random_uniform(UInt32(loot.count))) //A random number betweet 1 to array, casting to fit
            return loot[rand]
        }
        
        return nil
    }
}




