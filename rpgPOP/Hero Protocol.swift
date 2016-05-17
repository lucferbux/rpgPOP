//
//  Hero Protocol.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

protocol Hero {
    var classHero:String {get}
    var weapon:CharStat.Hero.Weapon {get}
    var armor:CharStat.Hero.Armor {get}
    var name:String {get}
    mutating func heal(hp:Int)
}

extension Character where Self: Hero {
    mutating func heal(hp:Int) {
        if life == maxLife {
            return
        } else if life + hp >= maxLife {
            life = maxLife
        } else {
            life += hp
        }
    }
    
    mutating func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= defense {
            life -= attackPwr
            return true
        }else{
            return false
        }
    }
}


