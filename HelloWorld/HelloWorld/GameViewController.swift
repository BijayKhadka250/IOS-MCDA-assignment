//
//  ViewController.swift
//  HelloWorld
//
//  Created by mcda on 2020-02-29.
//  Copyright © 2020 mcda. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // Mark : - properties
    var isCrossActive = true
    var record = [0,0,0,0,0,0,0,0,0]
    var theWins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    var gameend = false
    var counter = 0
    
    
    // Mark:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    @IBAction func PlayAgain(_ sender: UIButton) {
        record = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        PlayAgainButton.isHidden = true
        label.isHidden = true
        isCrossActive = true
        counter = 0
        gameend = false
        
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func bottomAction(_ sender: UIButton) {
        counter += 1
        if(record[sender.tag - 1] == 0 && gameIsActive == true){
            if isCrossActive {
                sender.setImage(UIImage(named:"cross"), for: .normal)
                record[sender.tag - 1] = 1
                isCrossActive = false
            }else {
                sender.setImage(UIImage(named:"circle"), for: .normal)
                record[sender.tag - 1] = 2
                isCrossActive = true
            }
            for  a in theWins{
                var result_cross = 0
                var result_circle = 0
                for  b in a {
                    if (record[b] == 1 ){
                        result_cross += 1
                    }
                    if (record[b] == 2 ){
                        result_circle += 1
                    }
                }
                if (result_cross == 3){
                    for c in a {
                        let btn1 = view.viewWithTag(c+1) as! UIButton
                        btn1.setImage(UIImage(named: "redCross"), for: .normal)
                    }
                    print("cross wined")
                    gameIsActive = false
                    label.text = "Cross has won"
                    PlayAgainButton.isHidden = false
                    label.isHidden = false
                    gameend = true
                    
                }
                if (result_circle == 3){
                    for c in a {
                        let btn2 = view.viewWithTag(c+1) as! UIButton
                        btn2.setImage(UIImage(named: "redCircle"), for: .normal)
                    }
                    print("circle wined")
                    label.text = "Circle has won"
                    gameIsActive = false
                    PlayAgainButton.isHidden = false
                    label.isHidden = false
                    gameend = true
                    
                }
            }
            if (counter == 9 && gameend == false){
            label.text = "No one won";
            
            PlayAgainButton.isHidden = false;
            label.isHidden = false
            }
            
            
        }
        
    }
    
    
    
}


