//
//  Character Protocol.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

protocol Character {
    var maxLife:Int {get}
    var life:Int {get set}
    var strength:Int {get}
    var defense:Int {get}
    
}

extension Character{
    var isAlive: Bool {
        get {
            if life <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    mutating func attemptAttack(attackPwr: Int) -> Bool{
        life -= attackPwr
        return true
    }
}

enum CharStat {
    enum Hero {
        enum HeroClass: String{
            case Ninja, Warrior, Knight
        }
        enum Weapon: Int {
            case Suriken = 20, Spear = 35, Sword = 30
        }
        enum Armor: Int {
            case NinjaArmor = 3, SpartanShield = 5, WarriorArmor = 4
        }
        enum Life: Int {
            case Ninja = 180, Warrior = 170, Knight = 120
        }
    }
    
    enum Enemy {
        enum EnemyClass: String{
            case AxeOrc, StickOrc
        }
        
        enum Weapon: Int {
            case Axe = 8, Stick = 9
        }
        enum Armor: Int {
            case LeatherArmor = 2, RustyIronArmor = 3
        }
        enum Life: Int {
            case AxeOrc = 70, StickOrc = 85
        }
    }
}