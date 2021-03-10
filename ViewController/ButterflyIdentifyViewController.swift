//
//  ButterflyIdentifyViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/6/19.
//  Copyright © 2020年 viplab. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ButterflyIdentifyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var bottom_img: UIImageView!
    
    @IBOutlet var button_photo: UIButton!
    @IBOutlet var button_identify: UIButton!
    @IBOutlet var button_help: UIButton!
    
    @IBOutlet var label_photo: UILabel!
    @IBOutlet var label_identify: UILabel!
    @IBOutlet var label_help: UILabel!
    
    @IBOutlet var red_point: UIImageView!
    @IBOutlet var green_point: UIImageView!
    @IBOutlet var blue_point: UIImageView!
    
    @IBOutlet var red_label: UILabel!
    @IBOutlet var green_label: UILabel!
    @IBOutlet var blue_label: UILabel!
    
    
    @IBOutlet var butterfly_image: UIImageView!
    
    @IBOutlet var label: UILabel!
    
    var model: Butterfly2!
    
    var array_sorted = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.sendSubviewToBack(butterfly_image)
        
        //get height & width of screen
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/3
        
        //設置button的大小
        bottom_img.frame = CGRect(x: 0, y: h*12.5, width: screen_width, height: h*1.5)
        button_photo.frame = CGRect(x: 0, y: h*12.5, width: w, height: h*1.5/3*2)
        button_identify.frame = CGRect(x: w, y: h*12.5, width: w, height: h*1.5/3*2)
        button_help.frame = CGRect(x: w*2, y: h*12.5, width: w, height: h*1.5/3*2)
        
        //幫button中的image調整大小
        button_photo.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/4, bottom: 0, right: w/4)
        button_identify.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/4, bottom: 0, right: w/4)
        button_help.imageEdgeInsets = UIEdgeInsets(top: h*0.2, left: w/4, bottom: 0, right: w/4)
        
        //設置label的大小
        label_photo.frame = CGRect(x: 0, y: h*13.5, width: w, height: h*0.5)
        label_identify.frame = CGRect(x: w, y: h*13.5, width: w, height: h*0.5)
        label_help.frame = CGRect(x: w*2, y: h*13.5, width: w, height: h*0.5)
        
        
        //設置三個點的大小位置
        red_point.frame = CGRect(x: screen_width/7, y: h*2, width: 20, height: 20)
        green_point.frame = CGRect(x: screen_width/7, y: h*2.5, width: 20, height: 20)
        blue_point.frame = CGRect(x: screen_width/7, y: h*3, width: 20, height: 20)
        //設置三個label的大小位置
        red_label.frame = CGRect(x: screen_width/7+25, y: h*2, width: screen_width/2, height: 20)
        green_label.frame = CGRect(x: screen_width/7+25, y: h*2.5, width: screen_width/2, height: 20)
        blue_label.frame = CGRect(x: screen_width/7+25, y: h*3, width: screen_width/2, height: 20)
        
        model = Butterfly2()
        
        butterfly_image.image = UIImage(named: "s080")
        OpenCVWrapper.getImageXY(butterfly_image)
        
    }
    
    
    //選擇圖片
    @IBAction func selectImage(_ sender: UIButton) {
        let picker: UIImagePickerController = UIImagePickerController()
        let alertController = UIAlertController(title: "選擇圖片", message: "開啟相簿或相機", preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "相簿", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                picker.sourceType = UIImagePickerController.SourceType.photoLibrary
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
        let alertAction2 = UIAlertAction(title: "相機", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                picker.sourceType = UIImagePickerController.SourceType.camera
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    var str: String!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        butterfly_image.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //點擊事件
    var touch_count = 0
    var loc = CGPoint(x: 0, y: 0)
    var locB = CGPoint(x: 0, y: 0)
    var locG = CGPoint(x: 0, y: 0)
    var loc_new = CGPoint(x: 0, y: 0)
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch : UITouch! = touches.first! as UITouch
//        if touch_count == 0 {
//            loc = touch.location(in: self.butterfly_image)
//            red_point.center = CGPoint(x: loc.x + butterfly_image.frame.minX, y: loc.y + butterfly_image.frame.minY)
//            OpenCVWrapper.getPoint1(red_point)
//            touch_count = 1
//        }
//        else if touch_count == 1 {
//            locB = touch.location(in: self.butterfly_image)
//            blue_point.center = CGPoint(x: locB.x + butterfly_image.frame.minX, y: locB.y + butterfly_image.frame.minY)
//            OpenCVWrapper.getPoint2(blue_point)
//            touch_count = 2
//        }
//        else {
//            locG = touch.location(in: self.butterfly_image)
//            green_point.center = CGPoint(x: locG.x + butterfly_image.frame.minX, y: locG.y + butterfly_image.frame.minY)
//            OpenCVWrapper.getPoint3(green_point)
//            touch_count = 0
//        }
//    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t : UITouch = touches.first! as UITouch
        loc = t.location(in: self.butterfly_image)
        loc_new = CGPoint(x: loc.x + butterfly_image.frame.minX, y: loc.y + butterfly_image.frame.minY)
        let rect_R = CGRect(x: red_point.frame.minX, y: red_point.frame.minY, width: red_point.frame.width, height: red_point.frame.height)
        let rect_B = CGRect(x: blue_point.frame.minX, y: blue_point.frame.minY, width: blue_point.frame.width, height: blue_point.frame.height)
        let rect_G = CGRect(x: green_point.frame.minX, y: green_point.frame.minY, width: green_point.frame.width, height: green_point.frame.height)
        let flag_R = rect_R.contains(loc_new)
        let flag_B = rect_B.contains(loc_new)
        let flag_G = rect_G.contains(loc_new)
        
        if flag_R == true{
            red_point.center = CGPoint(x: loc.x + butterfly_image.frame.minX, y: loc.y + butterfly_image.frame.minY)
            OpenCVWrapper.getPoint1(red_point)
        }
        if flag_B == true{
            blue_point.center = CGPoint(x: loc.x + butterfly_image.frame.minX, y: loc.y + butterfly_image.frame.minY)
            OpenCVWrapper.getPoint2(blue_point)
        }
        if flag_G == true{
            green_point.center = CGPoint(x: loc.x + butterfly_image.frame.minX, y: loc.y + butterfly_image.frame.minY)
            OpenCVWrapper.getPoint3(green_point)
        }
        
    }
    
    @IBAction func StartIdentify(_ sender: UIButton) {
        butterfly_image.image = OpenCVWrapper.imageRotation(butterfly_image.image!)
        butterfly_image.image = OpenCVWrapper.grabCut(butterfly_image.image!)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 224, height: 224), true, 2.0)
        butterfly_image.draw(CGRect(x: 0, y: 0, width: 224, height: 224))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) //3
        
        context?.translateBy(x: 0, y: newImage.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        butterfly_image.image = newImage
        
        guard let prediction = try? model.prediction(data: pixelBuffer!) else {
            return
        }
        label.text = prediction.classLabel
        
        let dict = prediction.softmax
        let sorted_key = dict.keys.sorted(by: {dict[$0]! > dict[$1]!})
        array_sorted = sorted_key
        print(sorted_key)
        
        //download photo to Library
        UIImageWriteToSavedPhotosAlbum(newImage, self, nil, nil)
        
        
        //get height & width of screen
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        //計算高度和寬度單元
        let h = screen_height/14
        red_point.frame = CGRect(x: screen_width/7, y: h*2, width: 20, height: 20)
        green_point.frame = CGRect(x: screen_width/7, y: h*2.5, width: 20, height: 20)
        blue_point.frame = CGRect(x: screen_width/7, y: h*3, width: 20, height: 20)
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child(userId)
        
        var egg = 0
        var larva = 0
        var pupa = 0
        databaseRef.child("RateOfFeed").observeSingleEvent(of: .value, with: {(snapshot) in
            let RateOfFeed = snapshot.value as! [String: Any]
            print(RateOfFeed)
            egg = RateOfFeed["egg"] as! Int
            larva = RateOfFeed["larva"] as! Int
            pupa = RateOfFeed["pupa"] as! Int
            
            if larva == 0 && egg < 4 && pupa == 0 { egg = egg + 1 }
            else if egg == 4 {
                egg = 0
                larva = 1
            }
            else if egg == 0 && larva < 4 && pupa == 0 { larva = larva + 1 }
            else if larva == 4 {
                larva = 0
                pupa = 1
            }
            else if egg == 0 && larva == 0 && pupa < 4 { pupa = pupa + 1 }
            else if pupa == 4 {
                egg = 1
                pupa = 0
                databaseRef.child("butterfly_partner").child("1").setValue(1)
            }
            databaseRef.child("RateOfFeed").child("egg").setValue(egg)
            databaseRef.child("RateOfFeed").child("larva").setValue(larva)
            databaseRef.child("RateOfFeed").child("pupa").setValue(pupa)
        })
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? IdentifySearchViewController
        controller?.butterfly = array_sorted
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        touch_count = 0
        viewDidLoad()
    }
}
