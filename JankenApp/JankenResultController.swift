//
//  JankenResultController.swift
//  JankenApp
//
//  Created by 陣川太郎 on 2018/08/09.
//  Copyright © 2018年 陣川太郎. All rights reserved.
//

import UIKit
import AVFoundation
class JankenResultController: UIViewController {
    var jankenResultcall:AVAudioPlayer?
    var callURL:URL?
    @IBOutlet weak var winlabel: UILabel!
    @IBOutlet weak var resultText: UILabel!
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let aiko = UIImage(named: "あいこ.jpeg")
    let win = UIImage(named: "勝ち.jpg")
    let lose = UIImage(named: "負け.jpg")
    
    @IBOutlet weak var JankenResultImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if appDelegate.jankenresult == 0{
            JankenResultImage.image = aiko
            resultText.text = "あいこじゃ"
            appDelegate.winCount = 0
            callURL = Bundle.main.url(forResource: "あいこコール", withExtension: "m4a")
            playJankenCall()
            
        }else if appDelegate.jankenresult == 1 {
            JankenResultImage.image = win
            resultText.text = "あんたの勝ちじゃ"
            appDelegate.winCount += 1
            if appDelegate.winCount > 1 {
                winlabel.text = "\(String(describing: appDelegate.winCount))連勝！"
            }
            
            callURL = Bundle.main.url(forResource: "勝ちコール", withExtension: "m4a")
            playJankenCall()
        }else{
            JankenResultImage.image = lose
            resultText.text = "ワシの勝ちじゃ"
            appDelegate.winCount = 0
            callURL = Bundle.main.url(forResource: "負けコール", withExtension: "m4a")
            playJankenCall()
        }

        // Do any additional setup after loading the view.
    }
    
    func playJankenCall(){
        do {
            jankenResultcall = try AVAudioPlayer(contentsOf: callURL!)
            jankenResultcall?.prepareToPlay()      // 即時再生させる
            jankenResultcall?.play()               // BGMを鳴らす
            
        } catch {
            print("error...")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
