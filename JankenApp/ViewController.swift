//
//  ViewController.swift
//  JankenApp
//
//  Created by 陣川太郎 on 2018/07/01.
//  Copyright © 2018年 陣川太郎. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let randomJanken = GKRandomSource()

    
    @IBOutlet weak var text1: UILabel!
    
    
    @IBOutlet weak var jankenImage: UIImageView!
    
    
    @IBAction func gu(_ sender: Any) {
        jankenplay(Player: 0)
        
        
    }
    
    
    @IBAction func choki(_ sender: Any) {
         jankenplay(Player: 1)
    }
    
    
    @IBAction func pha(_ sender: Any) {
         jankenplay(Player: 2)
    }
    
    
    func jankenplay(Player: Int){
        let comp = randomJanken.nextInt(upperBound: 3)
        var msg = ""
        switch comp {
        case 0:
            jankenImage.image = UIImage(named: "M-j_gu01.png")
            switch Player{
                
            case 0:
                msg = "あいこじゃ"
            case 1:
                msg = "おぬしの負けじゃ"
            case 2:
                msg = "おぬしの勝ちじゃ"
            default:
                break
                
            }
        case 1:
            jankenImage.image = UIImage(named: "M-j_ch01.png")
            switch Player{
                
            case 0:
                msg = "おぬしの勝ちじゃ"
            case 1:
                msg = "あいこじゃ"
            case 2:
                msg = "おぬしの負けじゃ"
            default:
                break
                
            }
        case 2:
            jankenImage.image = UIImage(named: "M-j_pa01.png")
            switch Player{
                
            case 0:
                msg = "おぬしの負けじゃ"
            case 1:
                msg = "おぬしの勝ちじゃ"
            case 2:
                msg = "あいこじゃ"
            default:
                break
                
            }
        default: break
        }
        
        text1.text = msg
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

