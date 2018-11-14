//
//  ViewController.swift
//  InstaImagePicker
//
//  Created by Togami Yuki on 2018/11/14.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    //選択した写真を入れるための変数
    var selectPhoto:UIImage!
    //UIImageViewを配置し、プログラムと紐ずける。
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //画面が表示される直前に呼ばれる。
    override func viewWillAppear(_ animated: Bool) {
        //selectPhotoにUIImageが入っているなら、その画像を表示。入っていないなら、デフォルト画像を表示。
        if selectPhoto != nil{
            imageView.image = selectPhoto
        }else{
            imageView.image = UIImage(named: "default.jpg")
        }
    }
    
    
    //このボタンを押すと、インスタ風のイメージピッカーViewが表示される。
    @IBAction func ImagePickerAct(_ sender: UIButton) {
        //「YPImagePicker」クラスのインスタンス化
        let picker = YPImagePicker()
        
        //Pickerが閉じられた時に動作する。
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    print("phote",photo.image)
                    self.selectPhoto = photo.image
                case .video(let video):
                    print("video",video)
                }
            }
            //「Cancel」ボタンが押された時と、「Next」ボタンが押された時の動作。
            if cancelled {
                //「Cancel」ボタンが押された時の処理
                picker.dismiss(animated: true, completion: nil)
            }else{
                //「Next」ボタンが押された時の処理
                picker.dismiss(animated: true, completion: nil)
            }
        }
        //Pickerを表示するコード
        present(picker, animated: true, completion: nil)
    }
    


}

