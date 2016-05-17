//
//  Player.swift
//  rpgPOP
//
//  Created by lucas fernández on 04/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

struct Player: Character, Hero, Attack {
    var maxLife:Int
    var life:Int
    var strength:Int
    var defense:Int
    
    var classHero:String
    var weapon:CharStat.Hero.Weapon
    var armor:CharStat.Hero.Armor
    var name:String 

    init(life: CharStat.Hero.Life, weapon: CharStat.Hero.Weapon, armor: CharStat.Hero.Armor, classHero: CharStat.Hero.HeroClass, name: String){
        self.maxLife = life.rawValue
        self.life = life.rawValue
        self.strength = weapon.rawValue
        self.defense = armor.rawValue
        self.classHero = classHero.rawValue
        self.weapon = weapon
        self.armor = armor
        self.name = name
    }
    
}