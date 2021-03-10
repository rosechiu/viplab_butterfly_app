//
//  ButterflyDetailViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2021/1/20.
//  Copyright © 2021 viplab. All rights reserved.
//

import UIKit
import WebKit

class ButterflyDetailViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    var urlStr : String!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            WebView.load(request)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
