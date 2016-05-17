//
//  MenuViewController.swift
//  rpgPOP
//
//  Created by lucas fernández on 06/05/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var selectedCharacter:Int = 1
    
    @IBAction func characterSelected(btn: UIButton){
        
        switch btn.tag {
        case 1: selectedCharacter = 1
        case 2: selectedCharacter = 2
        case 3: selectedCharacter = 3
        default: selectedCharacter = 1
        }
        
        performSegueWithIdentifier("showGame", sender: selectedCharacter)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
        if segue.identifier == "showGame"{
            if let gameVC = segue.destinationViewController as? ViewController{ //we need to cast to the destination
                if let selection = sender as? Int { //We are expecting a string
                    gameVC.characterSelection = selection
                }
            }
        }
    }
    
    override func viewDidLoad() {
    }
}
