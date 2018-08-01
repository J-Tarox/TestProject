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
    
    //乱数作成インスタンス
    let randomJanken = GKRandomSource()

    //テキストとじゃんけん画像のインポート
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var jankenImage: UIImageView!
    
    
    
    //じゃんけん実行メソッド
    //引数[0 = グー],[1 = チョキ],[2 = パー]
    func jankenplay(Player: String){
        
        //1~3までの乱数生成
        let comp = randomJanken.nextInt(upperBound: 3)
        //じゃんけんメッセージ
        var msg = ""
        
        
        switch comp {
            //乱数0の時
        case 0:
            jankenImage.image = UIImage(named: "M-j_gu01.png")
            switch Player{
            case "グー": //グー
                msg = "あいこじゃ"
            case "チョキ": //チョキ
                msg = "おぬしの負けじゃ"
            case "パー": //パー
                msg = "おぬしの勝ちじゃ"
            default:
                break
                
            }
            //乱数1の時
        case 1:
            jankenImage.image = UIImage(named: "M-j_ch01.png")
            switch Player{
                
            case "グー": //グー
                msg = "おぬしの勝ちじゃ"
            case "チョキ": //チョキ
                msg = "あいこじゃ"
            case "パー": //パー
                msg = "おぬしの負けじゃ"
            default:
                break
                
            }
        case 2:
            jankenImage.image = UIImage(named: "M-j_pa01.png")
            switch Player{
                
            case "グー": //グー
                msg = "おぬしの負けじゃ"
            case "チョキ": //チョキ
                msg = "おぬしの勝ちじゃ"
            case "パー": //パー
                msg = "あいこじゃ"
            default:
                break
                
            }
        default: break
        }
        
        text1.text = msg
        
    }
    
    //グーボタンが押された時の処理
    @IBAction func gu(_ sender: Any) {
        jankenplay(Player: "グー")
    }
    
    //チョキボタンが押された時の処理
    @IBAction func choki(_ sender: Any) {
        jankenplay(Player: "チョキ")
    }
    
    //パーボタンが押された時の処理
    @IBAction func pha(_ sender: Any) {
        jankenplay(Player: "パー")
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

