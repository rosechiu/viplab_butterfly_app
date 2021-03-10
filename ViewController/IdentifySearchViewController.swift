//
//  IdentifySearchViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/12/15.
//  Copyright © 2020 viplab. All rights reserved.
//

import UIKit

class IdentifySearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var butterfly: Array<String> = []
    
    let name = [ ["1 037 1 0","T1"],["1 040 1 0","T2"],["1 041 1 0","T3"],["1 055 1 0","T4"],["2 069 1 1","T5"],["2 069 1 2","T6"],["2 074 1 0","T7"],["2 076 1 0","T8"],["2 080 1 0","T9"],["2 082 1 0","T11"],["2 088 1 0","T12"],["2 091 1 1","T13"],["2 091 1 2","T14"],["2 092 1 0","T15"],["2 093 1 0","T16"],["2 094 1 0","T17"],["2 095 1 0","T18"],["2 096 1 0","T19"],["2 097 1 0","T20"],["2 097 1 1","T21"],["2 097 1 2","T22"],["2 100 1 0","T23"],["2 105 1 0","T24"],["3 114 1 0","T25"],["3 116 1 0","T26"],["3 123 1 0","T27"],["3 123 1 1","T28"],["3 126 1 0","T29"],["3 128 1 0","T30"],["3 129 1 0","T31"],["3 130 1 0","T32"],["3 132 1 0","T33"],["3 132 1 3","T34"],["3 132 1 4","T35"],["3 132 1 5","T36"],["3 132 1 6","T37"],["3 135 1 0","T38"],["4 418 1 0","T39"],["4 227 1 0","T40"],["4 228 1 0","T41"],["4 234 1 0","T42"],["4 236 1 0","T43"],["4 253 1 0","T44"],["4 263 1 0","T45"],["5 270 1 0","T46"],["5 272 1 0","T47"],["5 273 1 0","T48"],["5 274 1 0","T49"],["5 276 1 0","T50"],["5 277 1 0","T51"],["5 280 1 0","T52"],["5 282 1 1","T53"],["5 282 1 2","T54"],["5 285 1 0","T55"],["5 290 1 0","T56"],["5 291 1 0","T57"],["5 294 1 0","T58"],["5 297 1 0","T59"],["5 301 1 0","T60"],["5 302 1 0","T61"],["5 303 1 0","T62"],["5 306 1 0","T63"],["5 309 1 0","T64"],["5 310 1 0","T65"],["5 312 1 0","T66"],["5 313 1 0","T67"],["5 315 1 0","T68"],["5 316 1 0","T69"],["5 317 1 1","T70"],["5 317 1 2","T71"],["5 318 1 0","T72"],["5 320 1 0","T73"],["5 321 1 0","T74"],["5 324 1 0","T75"],["5 345 1 0","T76"],["5 356 1 0","T77"],["5 359 1 0","T78"],["5 360 1 1","T79"],["5 360 1 2","T80"],["5 366 1 0","T81"],["5 371 1 0","T82"],["5 374 1 0","T83"],["5 377 1 0","T84"],["5 380 1 0","T85"],["5 397 1 1","T86"],["5 397 1 2","T87"],["5 406 1 0","T88"],["5 407 1 0","T89"],["5 409 1 0","T90"],["5 412 1 0","T91"],["5 416 1 0","T92"],["5 417 1 0","T93"],["5 418 1 0","T94"] ]
    var image: Array<String> = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return butterfly.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IdentifyTableViewCell
        cell.name.text = butterfly[indexPath.row]
        cell.img.image = UIImage(named: image[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 120
        print(name[0][0])
        for i in butterfly {
            for j in 0...92 {
                if i.contains(name[j][0]) == true {
                    image.append(name[j][1])
                }
            }
        }
        image.append("T94")
        image.append("T90")
        print(image.count)
        // Do any additional setup after loading the view.
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
