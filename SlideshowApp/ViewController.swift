//
//  ViewController.swift
//  SlideshowApp
//
//  Created by FUKO SUZUKI on 2019/04/21.
//  Copyright © 2019 FUKO.SUZUKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var returnbtn: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var slidebtn: UIButton!
    
    var flag: Bool = false //スライドショーの実行を判定

    var slideshowimage = ["kadaiimage1","kadaiimage2","kadaiimage3"] //画像を格納
    
    @objc func slideshow(_ sender: Timer){ //method of slideshow
        imageview.image = UIImage(named: self.slideshowimage[dispnum])
        dispnum += 1
        if dispnum >= 3 {
            dispnum = 0 //最後の画像を表示している場合最初の画像に戻す
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期イメージを表示させる
        imageview.image = UIImage(named: slideshowimage[0])
        timer = nil
    }

    var dispnum = 0 //表示させる画像の位置番号

    var timer: Timer! //スライドショーで使用するタイマー
    
    
    private func showImage() {
        imageview.image = UIImage(named: slideshowimage[dispnum])
    }
    
    @IBAction func tapimage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "result" {
            
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
            
            resultViewController.enlargeimage = imageview.image
        }
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) { //推移後の画面から戻るための準備
    }
    
    
    @IBAction func nextbutton(_ sender: Any) { //進ボタンの設置
        if flag == false {
            
            imageview.image = UIImage(named: self.slideshowimage[dispnum])
            dispnum += 1
            if dispnum >= 3 {
                dispnum = 0
            }
            
            }
        }
    
    @IBAction func returnbutton(_ sender: Any) { //戻るボタンの設置
        if flag == false {
            
            imageview.image = UIImage(named: self.slideshowimage[dispnum])
            dispnum -= 1
            if dispnum <= -1 {
                dispnum = 2
            }
            }
            
        }
    

    @IBAction func slidebutton(_ sender: UIButton) {//再生、停止ボタンの設置
        if flag == false { //再生中でない場合
            if self.timer == nil { //タイマー二重起動の防止
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true) // 一定時間ごとにdispnumを１追加
            self.returnbtn.isEnabled = false //進む、戻るボタンを停止
            self.nextBtn.isEnabled = false
            flag = true
            }
        }else if flag == true {
            self.timer.invalidate() // タイマーを停止
            self.returnbtn.isEnabled = true //進む、戻るボタンを停止
            self.nextBtn.isEnabled = true
            flag = false
        }
        
            }
   


}
