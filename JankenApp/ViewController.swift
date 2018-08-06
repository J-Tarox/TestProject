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
     var player:AVAudioPlayer?
    var pon:AVAudioPlayer?
    
    var soundURL = Bundle.main.url(forResource: "じゃんけんコール", withExtension: "mp4")

    //乱数作成インスタンス
    let randomJanken = GKRandomSource()

    //テキストとじゃんけん画像のインポート
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var jankenImage: UIImageView!
    
    
    
    //じゃんけん実行メソッド
    //引数[0 = グー],[1 = チョキ],[2 = パー]
    func jankenplay(Player: String){
        
        soundURL = Bundle.main.url(forResource: "ぽんコール", withExtension: "m4a")
        playmusic(count: 0)
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
                soundURL = Bundle.main.url(forResource: "あいこコール", withExtension: "m4a")
                playmusic(count: 1)
            case "チョキ": //チョキ
                msg = "ワシの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "負けコール", withExtension: "m4a")
                playmusic(count: 1)
            case "パー": //パー
                msg = "あんたの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "勝ちコール", withExtension: "m4a")
                playmusic(count: 1)
            default:
                break
                
            }
            //乱数1の時
        case 1:
            jankenImage.image = UIImage(named: "M-j_ch01.png")
            switch Player{
                
            case "グー": //グー
                msg = "あんたの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "勝ちコール", withExtension: "m4a")
                playmusic(count: 1)
            case "チョキ": //チョキ
                msg = "あいこじゃ"
                soundURL = Bundle.main.url(forResource: "あいこコール", withExtension: "m4a")
                playmusic(count: 1)
            case "パー": //パー
                msg = "ワシの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "負けコール", withExtension: "m4a")
                playmusic(count: 1)
            default:
                break
                
            }
        case 2:
            jankenImage.image = UIImage(named: "M-j_pa01.png")
            switch Player{
                
            case "グー": //グー
                msg = "ワシの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "負けコール", withExtension: "m4a")
                playmusic(count: 1)
            case "チョキ": //チョキ
                msg = "あんたの勝ちじゃ"
                soundURL = Bundle.main.url(forResource: "勝ちコール", withExtension: "m4a")
                playmusic(count: 1)
            case "パー": //パー
                msg = "あいこじゃ"
                soundURL = Bundle.main.url(forResource: "あいこコール", withExtension: "m4a")
                playmusic(count: 1)
            default:
                break
                
            }
        default: break
        }
        
        text1.text = msg
        
    }
    
    //グーボタンが押された時の処理
    @IBAction func gu(_ sender: Any) {

        soundURL = Bundle.main.url(forResource: "ぽんコール", withExtension: "m4a")
        playmusic(count: 1)
        jankenplay(Player: "グー")
    }
    
    //チョキボタンが押された時の処理
    @IBAction func choki(_ sender: Any) {
        soundURL = Bundle.main.url(forResource: "ぽんコール", withExtension: "m4a")
        playmusic(count: 1)
        jankenplay(Player: "チョキ")
    }
    
    //パーボタンが押された時の処理
    @IBAction func pha(_ sender: Any) {
        soundURL = Bundle.main.url(forResource: "ぽんコール", withExtension: "m4a")
        playmusic(count: 1)
        jankenplay(Player: "パー")
    }
    
    func playmusic(count:Int){
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
            if count == 0{
            player?.numberOfLoops = -1   // ループ再生する
            player?.prepareToPlay()      // 即時再生させる
            player?.play()               // BGMを鳴らす
            }else{
            player?.prepareToPlay()      // 即時再生させる
            player?.play()
            }
        } catch {
            print("error...")
        }
    }
    func stopmusic(){
        player?.stop()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       playmusic(count: 0)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toLogout") {
            stopmusic()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

