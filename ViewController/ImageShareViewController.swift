//
//  ImageShareViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/6/19.
//  Copyright © 2020年 viplab. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ImageShareViewController: UIViewController {
    
    
    @IBOutlet var bottom_image: UIImageView!
    @IBOutlet var butterfly_identify: UIButton!
    @IBOutlet var user_info: UIButton!
    @IBOutlet var butterfly_book: UIButton!
    
    @IBOutlet var label_identify: UILabel!
    @IBOutlet var label_userInfo: UILabel!
    @IBOutlet var label_book: UILabel!
    
    @IBOutlet var partner_image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get height & width of screen
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/3
        
        //設置button的大小
        bottom_image.frame = CGRect(x: 0, y: h*12.5, width: screen_width, height: h*1.5)
        butterfly_identify.frame = CGRect(x: 0, y: h*12.5, width: w, height: h*1.5/3*2)
        butterfly_book.frame = CGRect(x: w, y: h*12.5, width: w, height: h*1.5/3*2)
        user_info.frame = CGRect(x: w*2, y: h*12.5, width: w, height: h*1.5/3*2)
        
        //幫button中的image調整大小
        butterfly_identify.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/4, bottom: 0, right: w/4)
        butterfly_book.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/4, bottom: 0, right: w/4)
        user_info.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/3, bottom: 0, right: w/3)
        
        //設置label的大小
        label_identify.frame = CGRect(x: 0, y: h*13.5, width: w, height: h*0.5)
        label_book.frame = CGRect(x: w, y: h*13.5, width: w, height: h*0.5)
        label_userInfo.frame = CGRect(x: w*2, y: h*13.5, width: w, height: h*0.5)
        
        label.frame = CGRect(x: 0, y: h*11, width: screen_width, height: h)
        
//        //NavigationBarButtonItem圖片設計
//        let image = UIImage(named: "camera")!
//        let smallCamera = resizeImage(image: image, width: 28)
//        camera_button.image = smallCamera
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child(userId)
        
        var egg = 0
        var larva = 0
        var pupa = 0
        databaseRef.child("RateOfFeed").observe(.value , with: {(snapshot) in
            let RateOfFeed = snapshot.value as! [String: Any]
            egg = RateOfFeed["egg"] as! Int
            larva = RateOfFeed["larva"] as! Int
            pupa = RateOfFeed["pupa"] as! Int
        
            var current_type = 0
            if egg == 0 && egg == larva && egg == pupa {
                current_type = 0
                self.partner_image.backgroundColor = UIColor.white
                self.label.text = "透過辨識蝴蝶獲得蝴蝶的卵吧!"
            }
            else if egg != 0 {
                current_type = egg
                self.partner_image.image = UIImage(named: "egg_test")
                self.label.text = "透過辨識蝴蝶讓卵孵化吧!"
            }
            else if larva != 0 {
                current_type = larva
                self.partner_image.image = UIImage(named: "larva_test")
                self.label.text = "透過辨識蝴蝶使幼蟲成長吧!"
            }
            else if pupa <= 3 {
                current_type = pupa
                self.partner_image.image = UIImage(named: "pupa_test")
                self.label.text = "透過辨識蝴蝶幫助蝴蝶羽化吧!"
            }
            else if pupa >= 4 {
                current_type = 0
                self.partner_image.image = UIImage(named: "s106")
                self.label.text = "成功羽化!恭喜獲得新夥伴!"
            }
            
            let Path = UIBezierPath(rect: CGRect(x: 35, y: 100, width: 300, height: 5))
            let Layer = CAShapeLayer()
            Layer.path = Path.cgPath
            Layer.strokeColor = UIColor.gray.cgColor
            Layer.lineWidth = 10
            Layer.fillColor = UIColor.clear.cgColor
            
            let perPath = UIBezierPath(rect: CGRect(x: 35, y: 100, width: current_type*75, height: 5))
            let perLayer = CAShapeLayer()
            perLayer.path = perPath.cgPath
            perLayer.strokeColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
            perLayer.lineWidth = 10
            perLayer.fillColor = UIColor.clear.cgColor
            self.view.layer.addSublayer(Layer)
            self.view.layer.addSublayer(perLayer)
        })
    }
    
    func resizeImage(image: UIImage, width: CGFloat) -> UIImage {
        let size = CGSize(width: width, height:
            image.size.height * width / image.size.width)
        let renderer = UIGraphicsImageRenderer(size: size)
        let newImage = renderer.image { (context) in
            image.draw(in: renderer.format.bounds)
        }
        return newImage
    }
    
}
