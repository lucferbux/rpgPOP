//
//  ViewController.swift
//  rpgPOP
//
//  Created by lucas fernández on 04/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //var declarations
    var player: Player!
    var enemy: Orc!
    var chestMessage: String?
    var playerAudio: AVAudioPlayer = AVAudioPlayer()
    var characterSelection = 3
    var imageSelection: String?
    
    //outlets
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: EnemyImg!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var attackButton: UIButton!
    
    @IBOutlet weak var playerImage: PlayerImg!
    
    //Actions
    @IBAction func onChestPressed(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = chestMessage
        //Now give some time to do the animation smoother
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func onAttackPressed(sender: AnyObject) {
        let attack = player.strength
        
        let color = UIColor(red: 242.0/255, green: 214.0/255, blue: 29.0/255, alpha: 1.0)
        printLabel.textColor = color
        
        if enemy.attemptAttack(attack){
            printLabel.text = "\(player.name) attacked \(enemy.classEnemy) for \(attack)"
            enemyHpLabel.text = "\(enemy.life) HP"
        } else {
            printLabel.text = "\(player.name) attack was unsuccesful!"
        }
        
        if let loot = enemy.dropLoot() {
            //player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        attackButton.enabled = false
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.classEnemy)"
            enemyImage.hidden = true
        }else{
            
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.enemyAttacks), userInfo: nil, repeats: false)
        }
        
    }

    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        newGame()
    }
    
    override func viewDidAppear(animated: Bool) {
        //newGame()
    }
    
    func newGame() {
        generatePlayer()
        generateRandomEnemy()
        
        let audioPath = NSBundle.mainBundle().pathForResource("mainSound", ofType: "mp3")!
        do{
            try
                playerAudio = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath)!)
            playerAudio.numberOfLoops = -1
            
        } catch let error as NSError {
            
            error.description
        }
        
        playerAudio.play()
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Orc(life: CharStat.Enemy.Life.AxeOrc, weapon: CharStat.Enemy.Weapon.Axe, armor: CharStat.Enemy.Armor.LeatherArmor, classEnemy: CharStat.Enemy.EnemyClass.AxeOrc)
            enemyImage.playIdleAnimation("AxeOrc")
        }else{
            enemy = Orc(life: CharStat.Enemy.Life.StickOrc, weapon: CharStat.Enemy.Weapon.Stick, armor: CharStat.Enemy.Armor.RustyIronArmor, classEnemy: CharStat.Enemy.EnemyClass.StickOrc)
            enemyImage.playIdleAnimation("StickOrc")
        }
        
        enemyHpLabel.text = "\(enemy.life) HP"
        enemyImage.hidden = false
        attackButton.enabled = true
        printLabel.text = "An \(enemy.classEnemy) appeared!"
    }

    func enemyAttacks() {
        let attack = enemy.strength
        let color = UIColor(red: 176/255, green: 9/255, blue: 53/255, alpha: 1.0)
        printLabel.textColor = color
        
        if player.attemptAttack(attack){
            printLabel.text = "\(enemy.classEnemy) attacked \(player.name) for \(attack)"
            playerHpLabel.text = "\(player.life) HP"
        } else {
            printLabel.text = "\(enemy.classEnemy) attack was unsuccesful!"
        }
        
        if !player.isAlive {
            //playerImage.hidden = true
            playerHpLabel.text = ""
            printLabel.text = "You loose."
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.playerDead), userInfo: nil, repeats: false)
        }else{
            attackButton.enabled = true
        }
    }
    
    func playerDead() {
        
        playerAudio.stop()
        performSegueWithIdentifier("showMenu", sender: nil)
        
    }
    
    func generatePlayer() {
        
        switch characterSelection {
        case 1: player = Player(life: CharStat.Hero.Life.Warrior, weapon: CharStat.Hero.Weapon.Sword, armor: CharStat.Hero.Armor.WarriorArmor, classHero: CharStat.Hero.HeroClass.Knight, name: "Lucas")
        imageSelection = "Knight"
            
        case 2: player = Player(life: CharStat.Hero.Life.Ninja, weapon: CharStat.Hero.Weapon.Suriken, armor: CharStat.Hero.Armor.NinjaArmor, classHero: CharStat.Hero.HeroClass.Ninja, name: "Lucas")
            imageSelection = "Ninja"
            
        case 3: player = Player(life: CharStat.Hero.Life.Knight, weapon: CharStat.Hero.Weapon.Spear, armor: CharStat.Hero.Armor.SpartanShield, classHero: CharStat.Hero.HeroClass.Warrior, name: "Lucas")
            imageSelection = "Warrior"
            
        default: player = Player(life: CharStat.Hero.Life.Warrior, weapon: CharStat.Hero.Weapon.Sword, armor: CharStat.Hero.Armor.WarriorArmor, classHero: CharStat.Hero.HeroClass.Warrior, name: "Lucas")
        imageSelection = "Knight"
        }
        
        playerImage.playIdleAnimation(imageSelection!)
        playerHpLabel.text = "\(player.life) HP"
        playerImage.hidden = false
        printLabel.text = "Press the attack button to attack"
        attackButton.enabled = true
    }

}


