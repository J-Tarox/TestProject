//
//  ViewController.swift
//  JankenApp
//
//  Created by 陣川太郎 on 2018/07/01.
//  Copyright © 2018年 陣川太郎. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ViewController: UIViewController {
     let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
     var jankencall:AVAudioPlayer?
    var pon:AVAudioPlayer?
    
    var callURL = Bundle.main.url(forResource: "じゃんけんコール", withExtension: "mp4")
    var ponURL = Bundle.main.url(forResource: "ぽんコール", withExtension: "m4a")
    @IBOutlet weak var gu: UIButton!
    @IBOutlet weak var choki: UIButton!
    @IBOutlet weak var pah: UIButton!
    
    //乱数作成インスタンス
    let randomJanken = GKRandomSource()

    //テキストとじゃんけん画像のインポート
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var jankenImage: UIImageView!
    
    
    
    //じゃんけん実行メソッド
    //引数[0 = グー],[1 = チョキ],[2 = パー]
    func jankenplay(Player: String){
        
        gu.isEnabled = false
        choki.isEnabled = false
        pah.isEnabled = false
        
        UIButton.appearance().isExclusiveTouch = true
       text1.text = "じゃんけん　ぽん！"
        playPonCall()
        
        //1~3までの乱数生成
        let comp = randomJanken.nextInt(upperBound: 3)
        //じゃんけんメッセージ
        
        
        
        switch comp {
            //乱数0の時
        case 0:
            jankenImage.image = UIImage(named: "M-j_gu01.png")
            switch Player{
            case "グー": //グー
                
                
                appDelegate.jankenresult = 0
            case "チョキ": //チョキ
               
               
                appDelegate.jankenresult = 2
            case "パー": //パー
               
               
                appDelegate.jankenresult = 1
            default:
                break
                
            }
            //乱数1の時
            //テストコメント
        case 1:
            jankenImage.image = UIImage(named: "M-j_ch01.png")
            switch Player{
                
            case "グー": //グー
               
               
                appDelegate.jankenresult = 1
            case "チョキ": //チョキ
                
              
                appDelegate.jankenresult = 0
            case "パー": //パー
               
              
                appDelegate.jankenresult = 2
            default:
                break
                
            }
        case 2:
            jankenImage.image = UIImage(named: "M-j_pa01.png")
            switch Player{
                
            case "グー": //グー
                
              
                appDelegate.jankenresult = 2
            case "チョキ": //チョキ
            
              
                appDelegate.jankenresult = 1
            case "パー": //パー
               
               
                appDelegate.jankenresult = 0
            default:
                break
                
            }
        default: break
        }
        
        
    
        
        RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 1.0))
        performSegue(withIdentifier: "toJankenResult", sender: nil)
    }
    
    
    //グーボタンが押された時の処理
    @IBAction func gu(_ sender: Any) {
        
        
        
        stopJankenCall()
        jankenplay(Player: "グー")
        
        
        
    }
    
    //チョキボタンが押された時の処理
    @IBAction func choki(_ sender: Any) {
       
       stopJankenCall()
        jankenplay(Player: "チョキ")
    }
    
    //パーボタンが押された時の処理
    @IBAction func pha(_ sender: Any) {
        
        stopJankenCall()
        jankenplay(Player: "パー")
    }
    
    func playJankenCall(){
        do {
            jankencall = try AVAudioPlayer(contentsOf: callURL!)
           
            jankencall?.numberOfLoops = -1   // ループ再生する
            jankencall?.prepareToPlay()      // 即時再生させる
            jankencall?.play()               // BGMを鳴らす
           
        } catch {
            print("error...")
        }
    }
    
    func playPonCall() {
        do {
            pon = try AVAudioPlayer(contentsOf: ponURL!)
            pon?.prepareToPlay()      // 即時再生させる
            pon?.play()               // BGMを鳴らす
            
        } catch {
            print("error...")
        }
        
    }
    func stopJankenCall(){
        jankencall?.stop()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       playJankenCall()
    
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toLogout") {
            stopJankenCall()
            
        }
        
        if (segue.identifier == "toJankenResult") {
           
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

