//
//  Orc.swift
//  rpgPOP
//
//  Created by lucas fernández on 05/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

struct Orc: Character, Enemy, Attack {
    var maxLife:Int
    var life:Int
    var strength:Int
    var defense:Int
    
    var classEnemy:String
    var weapon:CharStat.Enemy.Weapon
    var armor:CharStat.Enemy.Armor
    var loot:[String]
    
    
    
    init(life: CharStat.Enemy.Life,weapon: CharStat.Enemy.Weapon, armor: CharStat.Enemy.Armor, classEnemy: CharStat.Enemy.EnemyClass){
        self.maxLife = life.rawValue
        self.life = life.rawValue
        self.strength = weapon.rawValue
        self.classEnemy = classEnemy.rawValue
        self.defense = armor.rawValue
        self.weapon = weapon
        self.armor = armor
        
        
        switch classEnemy{
        case .AxeOrc: self.loot = ["Tough Hide", "Kimara Venom", "Rare Trident"]
        case .StickOrc: self.loot = ["Magic Wand", "Dark Ammulet", "Salted Pork"]
        }
        
    }
    
}