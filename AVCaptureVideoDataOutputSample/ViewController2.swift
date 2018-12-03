//
//  ViewController2.swift
//  AVCaptureVideoDataOutputSample
//
//  Created by 平岩郁人 on 2018/12/03.
//  Copyright © 2018 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var image:UIImage?
    
    @IBOutlet weak var image_view2: UIImageView!
    @IBOutlet weak var tool_bar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen_size = UIScreen.main.bounds.size
        
        tool_bar.frame = CGRect(x:0,y:screen_size.height-60,width:screen_size.width,height:60)
        image_view2.frame = CGRect(x:0,y:20,width:screen_size.width,height:screen_size.height-80)

        image_view2.image = image
       
        
    }
    
    @IBAction func save_button(_ sender: Any) {
        
        print("ok")
        
        // UIImage の画像をカメラロールに画像を保存
        UIImageWriteToSavedPhotosAlbum(image!, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    // 保存を試みた結果をダイアログで表示
    func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // OKボタンを追加
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // UIAlertController を表示
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
