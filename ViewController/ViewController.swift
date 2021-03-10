//
//  ViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/6/18.
//  Copyright © 2020年 viplab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var login_image: UIImageView!
    @IBOutlet var button_gmail: UIButton!
    @IBOutlet var button_fb: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get height & width of screen
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/5
        
        self.login_image.frame = CGRect(x: 0, y: 0, width: screen_width, height: h*10)
        self.button_gmail.frame = CGRect(x: w, y: h*10.5, width: w*3, height: h)
        self.button_fb.frame = CGRect(x: w, y: h*12, width: w*3, height: h)
        self.button_fb.layer.cornerRadius = h/2
        self.button_gmail.layer.cornerRadius = h/2
    }


}

