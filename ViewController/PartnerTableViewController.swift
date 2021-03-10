//
//  PartnerTableViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2021/3/3.
//  Copyright © 2021 viplab. All rights reserved.
//

import UIKit
import Firebase

class PartnerTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var p_name: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PartnerTableViewCell
        cell.name.text = "紅斑脈蛺蝶"
        return cell
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
