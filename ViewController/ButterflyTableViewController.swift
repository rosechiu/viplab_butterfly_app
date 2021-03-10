//
//  ButterflyTableViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/7/15.
//  Copyright © 2020年 viplab. All rights reserved.
//

import Foundation
import UIKit

class ButterflyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableview: UITableView!
    
    var text: String?
    
    var searchText: String?
    
    let url1 = ["https://zh.wikipedia.org/wiki/%E6%A9%99%E7%BF%85%E6%9A%AE%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%B8%89%E6%96%91%E8%B6%BE%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9B%99%E6%96%91%E8%B6%BE%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%84%A1%E5%B0%BE%E7%B5%A8%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%9C%93%E7%BF%85%E7%B5%A8%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%95%B7%E7%BF%85%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B6%A0%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%A4%90%E7%BF%85%E7%B6%A0%E5%BC%84%E8%9D%B6","https://taieol.tw/pages/105860","https://zh.wikipedia.org/wiki/%E9%BB%91%E6%BE%A4%E6%98%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%8F%E6%98%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%9F%94%E9%87%8C%E6%98%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E6%B5%81%E6%98%9F%E5%BC%84%E8%9D%B6","http://dearlep.tw/species.html?namecode=345462","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%AA%97%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%8F%E7%B4%8B%E9%A2%AF%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E9%A2%AF%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%91%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E8%A3%99%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%8E%89%E5%B8%B6%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%8F%E9%BB%83%E6%98%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E6%98%9F%E5%BC%84%E8%9D%B6","http://dearlep.tw/species.html?namecode=345450","http://dearlep.tw/species.html?namecode=345484","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E8%84%88%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%98%8F%E5%88%97%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E6%96%91%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%A2%96%E5%BC%84%E8%9D%B6","http://dearlep.tw/species.html?namecode=345481","https://zh.wikipedia.org/wiki/%E8%96%91%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%91%E6%98%9F%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%95%89%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E8%B5%AD%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E6%96%91%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B7%A1%E9%BB%83%E6%96%91%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A2%A8%E5%AD%90%E9%BB%83%E6%96%91%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%93%AC%E8%90%8A%E9%BB%83%E6%96%91%E5%BC%84%E8%9D%B6","http://dearlep.tw/species.html?namecode=345510","http://dearlep.tw/species.html?namecode=345508","https://taieol.tw/pages/105683","https://zh.wikipedia.org/wiki/%E7%A8%BB%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%8F%E7%A8%BB%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A6%BE%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%93%AC%E7%A7%88%E5%BC%84%E8%9D%B6","https://taieol.tw/pages/105822","https://zh.wikipedia.org/wiki/%E5%B0%96%E7%BF%85%E8%A4%90%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E8%A4%90%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B7%A8%E8%A4%90%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E7%B4%8B%E5%AD%94%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A2%8E%E7%B4%8B%E5%AD%94%E5%BC%84%E8%9D%B6","https://npgis.cpami.gov.tw/public/detail/SpeciesDetail.aspx?SP_ID=345494","http://dearlep.tw/species.html?namecode=345495","https://zh.wikipedia.org/wiki/%E5%A5%87%E8%90%8A%E5%AD%94%E5%BC%84%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%AF%E5%BC%84%E8%9D%B6","http://dearlep.tw/species.html?namecode=345457"]
    let url2 = ["https://zh.wikipedia.org/wiki/%E8%B1%94%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E8%B1%94%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%A2%9D%E6%96%91%E8%B1%94%E7%B2%89%E8%9D%B6","http://dearlep.tw/species.html?namecode=347334","https://zh.wikipedia.org/wiki/%E6%B5%81%E6%98%9F%E7%B5%B9%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E7%B5%B9%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%88%AA%E8%84%88%E7%B5%B9%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%8F%9C%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B7%A3%E9%BB%9E%E7%99%BD%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%A3%9B%E9%BE%8D%E7%99%BD%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B7%A1%E8%A4%90%E8%84%88%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%91%E8%84%88%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%91%B2%E9%82%8A%E5%B0%96%E7%B2%89%E8%9D%B6","http://dearlep.tw/species.html?namecode=347321","https://zh.wikipedia.org/wiki/%E7%95%B0%E8%89%B2%E5%B0%96%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9B%B2%E7%B4%8B%E5%B0%96%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%8B%B8%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%BA%A4%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%95%B0%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%A9%99%E7%AB%AF%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B4%B0%E6%B3%A2%E9%81%B7%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%81%B7%E7%B2%89%E8%9D%B6","http://www.dearlep.tw/species.html?namecode=347329","http://dearlep.tw/species.html?namecode=347333","https://zh.wikipedia.org/wiki/%E5%9C%93%E7%BF%85%E9%89%A4%E7%B2%89%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E9%89%A4%E7%B2%89%E8%9D%B6","http://dearlep.tw/species.html?namecode=347341","http://dearlep.tw/species.html?namecode=347343","http://dearlep.tw/species.html?namecode=347339","https://zh.wikipedia.org/wiki/%E9%BB%83%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%8C%97%E9%BB%83%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B3%B6%E5%B6%BC%E9%BB%83%E8%9D%B6","http://dearlep.tw/species.html?namecode=347340"]
    let url3 = ["https://zh.wikipedia.org/wiki/%E9%87%91%E8%A3%B3%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%86%92%E5%85%89%E8%A3%B3%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%9B%99%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A4%9A%E5%A7%BF%E9%BA%9D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%95%B7%E5%B0%BE%E9%BA%9D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BA%9D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B4%85%E7%8F%A0%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%8A%8D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%91%E5%B0%BE%E5%8A%8D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9D%92%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%AF%AC%E5%B8%B6%E9%9D%92%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%9C%A8%E8%98%AD%E9%9D%92%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B5%B1%E5%B8%A5%E9%9D%92%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%96%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E6%98%9F%E6%96%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%96%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%8F%B0%E7%81%A3%E5%AF%AC%E5%B0%BE%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%81%94%E6%91%A9%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%87%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%9F%91%E6%A9%98%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%8E%89%E5%B8%B6%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%97%8D%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%8E%89%E6%96%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A4%A7%E7%99%BD%E7%B4%8B%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%84%A1%E5%B0%BE%E7%99%BD%E6%96%91%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%8F%B0%E7%81%A3%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%BE%8E%E5%87%A4%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A2%A7%E5%87%A4%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A9%B9%E7%BF%A0%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9B%99%E7%92%B0%E7%BF%A0%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%90%89%E7%92%83%E7%BF%A0%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B7%B4%E9%BB%8E%E7%BF%A0%E9%B3%B3%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A2%A7%E5%87%A4%E8%9D%B6"]
    let url4 = ["https://zh.wikipedia.org/wiki/%E8%9A%9C%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%86%99%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%8A%80%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E9%8A%80%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B4%AB%E6%97%A5%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%94%9A%E9%9D%92%E7%B4%AB%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345690","https://zh.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E7%B4%AB%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345693","http://dearlep.tw/species.html?namecode=345689","http://dearlep.tw/species.html?namecode=428839","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%84%B0%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345795","http://dearlep.tw/species.html?namecode=345687","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%B7%9A%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%93%8F%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%9C%97%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345741","https://zh.wikipedia.org/wiki/%E9%8B%A9%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%BC%8F%E6%B0%8F%E9%8B%A9%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%98%BF%E9%87%8C%E5%B1%B1%E9%90%B5%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E9%90%B5%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E6%A6%BF%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%A2%A7%E7%BF%A0%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345710","http://dearlep.tw/species.html?namecode=345708","https://zh.wikipedia.org/wiki/%E6%8B%89%E6%8B%89%E5%B1%B1%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9C%A7%E7%A4%BE%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B8%85%E9%87%91%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%96%AE%E7%B7%9A%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E8%8A%92%E7%BF%A0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A4%B8%E7%88%B6%E7%92%80%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%96%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%A4%90%E7%BF%85%E9%9D%92%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345785","https://taieol.tw/pages/106064","https://zh.wikipedia.org/wiki/%E9%88%BF%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%98%AD%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%8E%B3%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345721","https://zh.wikipedia.org/wiki/%E9%8B%B8%E7%B7%A3%E7%81%B0%E8%9D%B6%E5%B1%AC","http://dearlep.tw/species.html?namecode=345772","http://dearlep.tw/species.html?namecode=345765","http://dearlep.tw/species.html?namecode=345768","http://dearlep.tw/species.html?namecode=345766","https://zh.wikipedia.org/wiki/%E9%AB%98%E7%A0%82%E7%87%95%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E6%B4%92%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345779","http://dearlep.tw/species.html?namecode=345782","https://zh.wikipedia.org/wiki/%E6%B1%9F%E5%B4%8E%E6%B4%92%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%BA%95%E4%B8%8A%E6%B4%92%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%8D%97%E6%96%B9%E6%B4%92%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B8%A1%E6%B0%8F%E7%83%8F%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345736","http://dearlep.tw/species.html?namecode=345735","https://zh.wikipedia.org/wiki/%E6%8B%89%E6%8B%89%E5%B1%B1%E9%91%BD%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%8A%80%E5%B8%B6%E4%B8%89%E5%B0%BE%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345775","https://zh.wikipedia.org/wiki/%E4%B8%89%E6%96%91%E8%99%8E%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%93%AC%E8%90%8A%E8%99%8E%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B7%92%E5%A4%A7%E9%8B%B8%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345753","http://dearlep.tw/species.html?namecode=345752","https://taieol.tw/pages/106351","http://dearlep.tw/species.html?namecode=345754","https://zh.wikipedia.org/wiki/%E5%A8%9C%E6%8B%89%E6%B3%A2%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=349780","https://zh.wikipedia.org/wiki/%E9%9B%85%E6%B3%A2%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B7%A1%E9%9D%92%E9%9B%85%E6%B3%A2%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345698","https://zh.wikipedia.org/wiki/%E5%A5%87%E6%B3%A2%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%BA%AE%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B4%B0%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%97%8D%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%8E%A7%E8%97%8D%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%8A%98%E5%88%97%E8%97%8D%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345731","https://zh.wikipedia.org/wiki/%E9%95%B7%E8%85%B9%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345729","https://taieol.tw/pages/106049","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%8E%84%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345791","https://zh.wikipedia.org/wiki/%E6%A3%AE%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345763","http://dearlep.tw/species.html?namecode=345762","http://dearlep.tw/species.html?namecode=345750","https://zh.wikipedia.org/wiki/%E5%AB%B5%E7%90%89%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E6%96%91%E5%AB%B5%E7%90%89%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9D%9B%E8%89%B2%E7%90%89%E7%81%B0%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%99%BD%E7%B4%8B%E7%90%89%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345700","http://dearlep.tw/species.html?namecode=345703","http://dearlep.tw/species.html?namecode=345702","http://dearlep.tw/species.html?namecode=345701","http://dearlep.tw/species.html?namecode=345696","https://zh.wikipedia.org/wiki/%E7%99%BD%E9%9B%80%E6%96%91%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345760","http://dearlep.tw/species.html?namecode=345705","https://zh.wikipedia.org/wiki/%E8%98%87%E9%90%B5%E7%B6%BA%E7%81%B0%E8%9D%B6","http://dearlep.tw/species.html?namecode=345733","http://dearlep.tw/species.html?namecode=345682","http://dearlep.tw/species.html?namecode=434517"]
    let url5 = ["http://dearlep.tw/species.html?namecode=347145","https://zh.wikipedia.org/wiki/%E8%99%8E%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%87%91%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9D%92%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%95%AC%E9%9D%92%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B5%B9%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%96%AF%E6%B0%8F%E7%B5%B9%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A4%A7%E7%B5%B9%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%96%91%E8%9D%B6%E4%BA%9E%E7%A7%91","https://zh.wikipedia.org/wiki/%E9%9B%99%E6%A8%99%E7%B4%AB%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%95%B0%E7%B4%8B%E7%B4%AB%E6%96%91%E8%9D%B6","http://dearlep.tw/species.html?namecode=347103","https://zh.wikipedia.org/wiki/%E9%BB%91%E7%B4%AB%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A6%92%E9%BA%97%E7%B4%AB%E6%96%91%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%A4%A7%E5%B8%9B%E6%96%91%E8%9D%B6","http://dearlep.tw/species.html?namecode=347069","https://zh.wikipedia.org/wiki/%E7%B6%A0%E8%B1%B9%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%86%B1%E5%B8%B6%E8%B1%B9%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%96%90%E8%B1%B9%E8%9B%B1%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%90%BA%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E8%A5%9F%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%BE%8E%E7%9C%BC%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%9B%87%E7%9C%BC%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%BF%A0%E8%97%8D%E7%9C%BC%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%AF%E7%9C%BC%E8%9B%BA%E8%9D%B6","http://www.dearlep.tw/species.html?namecode=347127","https://zh.wikipedia.org/wiki/%E6%B3%A2%E7%B4%8B%E7%9C%BC%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%9E%AF%E8%91%89%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E5%B8%B6%E9%9A%B1%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%9B%BA%E8%9D%B6%E7%A7%91","https://zh.wikipedia.org/wiki/%E5%A4%A7%E7%B4%85%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B0%8F%E7%B4%85%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%AA%81%E5%B0%BE%E9%89%A4%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%BB%83%E9%89%A4%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%90%89%E7%92%83%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B7%8B%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%95%A3%E7%B4%8B%E7%9B%9B%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%8A%B1%E8%B1%B9%E7%9B%9B%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%87%91%E6%96%91%E8%9B%B1%E8%9D%B6","https://zh.wikipedia.org/wiki/%E5%B9%BB%E7%B4%AB%E6%96%91%E8%9B%B1%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%AB%AF%E7%B4%AB%E5%B9%BB%E8%9B%BA%E8%9D%B6","http://dearlep.tw/species.html?namecode=347074","https://zh.wikipedia.org/wiki/%E4%B8%AD%E7%92%B0%E8%9B%BA%E8%9D%B6","http://dearlep.tw/species.html?namecode=347174","http://dearlep.tw/species.html?namecode=347175","https://zh.wikipedia.org/wiki/%E7%B4%B0%E5%B8%B6%E7%92%B0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%84%A1%E9%82%8A%E7%92%B0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%93%AC%E8%90%8A%E7%92%B0%E8%9B%BA%E8%9D%B6","http://dearlep.tw/species.html?namecode=347167","http://dearlep.tw/species.html?namecode=347173","http://dearlep.tw/species.html?namecode=347176","http://dearlep.tw/species.html?namecode=347163","http://dearlep.tw/species.html?namecode=347168","http://dearlep.tw/species.html?namecode=347169","http://dearlep.tw/species.html?namecode=347165","http://dearlep.tw/species.html?namecode=347170","http://dearlep.tw/species.html?namecode=347172","http://dearlep.tw/species.html?namecode=347182","https://zh.wikipedia.org/wiki/%E6%AE%98%E9%8D%94%E7%B7%9A%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%8E%84%E7%8F%A0%E5%B8%B6%E8%9B%BA%E8%9D%B6","http://dearlep.tw/species.html?namecode=347079","https://zh.wikipedia.org/wiki/%E7%99%BD%E5%9C%88%E5%B8%B6%E8%9B%BA%E8%9D%B6","http://dearlep.tw/species.html?namecode=347078","http://dearlep.tw/species.html?namecode=347077","https://zh.wikipedia.org/wiki/%E7%95%B0%E7%B4%8B%E5%B8%B6%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%9B%99%E8%89%B2%E5%B8%B6%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E4%B8%AB%E7%B4%8B%E4%BF%B3%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%91%99%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B4%85%E7%8E%89%E7%BF%A0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%A4%90%E8%93%93%E7%BF%A0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E9%A6%AC%E6%8B%89%E5%B7%B4%E7%BF%A0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%BF%A0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%AA%84%E5%B8%B6%E7%BF%A0%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B6%B2%E7%B5%B2%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E6%B5%81%E6%98%9F%E8%9B%BA%E8%9D%B6","https://zh.wikipedia.org/wiki/%E7%B5%B9%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%99%BD%E8%A3%B3%E8%B2%93%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%87%91%E9%8E%A7%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%99%AE%E6%B0%8F%E7%99%BD%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%99%BD%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%87%A6%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E7%87%A6%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%B4%85%E6%96%91%E8%84%88%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%A4%A7%E7%B4%AB%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%9B%99%E5%B0%BE%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%B0%8F%E9%9B%99%E5%B0%BE%E8%9B%BA%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%AE%AD%E7%92%B0%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E4%B8%B2%E7%8F%A0%E7%92%B0%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%B3%B3%E7%9C%BC%E6%96%B9%E7%92%B0%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%9F%8D%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%A4%A7%E8%97%8F%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%81%94%E9%82%A6%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%AF%B6%E5%B3%B6%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347213",
                "https://zh.wikipedia.org/wiki/%E7%8B%B9%E7%BF%85%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%AF%86%E7%B4%8B%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%B1%9F%E5%B4%8E%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%99%BD%E5%B8%B6%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%8E%8B%E6%B0%8F%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347220",
                "http://dearlep.tw/species.html?namecode=347217",
                "https://zh.wikipedia.org/wiki/%E6%96%87%E9%BE%8D%E6%B3%A2%E7%9C%BC%E8%9D%B6",
                "https://taieol.tw/pages/106820",
                "https://zh.wikipedia.org/wiki/%E5%A4%A7%E5%B9%BD%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347225",
                "https://zh.wikipedia.org/wiki/%E7%8E%89%E5%B1%B1%E5%B9%BD%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%95%B7%E7%B4%8B%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347143",
                "https://zh.wikipedia.org/wiki/%E7%8E%89%E5%B8%B6%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%B7%B1%E5%B1%B1%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%A4%A7%E6%B7%B1%E5%B1%B1%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%9B%B2%E7%B4%8B%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%9F%AF%E6%B0%8F%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "https://taieol.tw/pages/107267",
                "https://zh.wikipedia.org/wiki/%E5%B7%B4%E6%B0%8F%E9%BB%9B%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347140",
                "https://zh.wikipedia.org/wiki/%E9%BB%83%E6%96%91%E8%94%AD%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347160",
                "https://zh.wikipedia.org/wiki/%E9%98%BF%E8%8A%92%E8%94%AD%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347161",
                "https://zh.wikipedia.org/wiki/%E7%9C%89%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347156",
                "https://zh.wikipedia.org/wiki/%E7%A8%BB%E7%9C%89%E7%9C%BC%E8%9D%B6",
                "http://dearlep.tw/species.html?namecode=347157",
                "http://dearlep.tw/species.html?namecode=347155",
                "https://zh.wikipedia.org/wiki/%E5%88%87%E7%BF%85%E7%9C%89%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E5%B0%8F%E7%9C%89%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%B0%B8%E6%BE%A4%E8%9B%87%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%9A%AE%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E6%A3%AE%E6%9E%97%E6%9A%AE%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E6%96%91%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E7%BF%A0%E8%A2%96%E9%94%AF%E7%9C%BC%E8%9D%B6",
                "https://zh.wikipedia.org/wiki/%E9%95%B7%E7%B4%8B%E9%BB%9B%E7%9C%BC%E8%9D%B6"]
    var url: Array<String> = []
    
    let name1 = ["橙翅傘弄蝶","鐵色絨弄蝶","尖翅絨弄蝶","無尾絨弄蝶","圓翅絨弄蝶","長翅弄蝶","綠弄蝶","褐翅綠弄蝶","尖翅星弄蝶","黑澤星弄蝶","小星弄蝶","埔里星弄蝶","臺灣流星弄蝶","大流星弄蝶","臺灣窗弄蝶","小紋颯弄蝶","臺灣颯弄蝶","臺灣瑟弄蝶","白裙弄蝶","玉帶弄蝶","白弄蝶","小黃星弄蝶","黃星弄蝶","弧弄蝶","黃點弄蝶","臺灣脈弄蝶","昏列弄蝶","白斑弄蝶","袖弄蝶","連紋袖弄蝶","薑弄蝶","黑星弄蝶","蕉弄蝶","臺灣赭弄蝶","黃斑弄蝶","淡黃斑弄蝶","墨子黃斑弄蝶","蓬萊黃斑弄蝶","寬邊橙斑弄蝶","竹橙斑弄蝶","熱帶橙斑弄蝶","稻弄蝶","姬稻弄蝶","禾弄蝶","假禾弄蝶","褐弄蝶","尖翅褐弄蝶","中華褐弄蝶","巨褐弄蝶","黃紋孔弄蝶","碎紋孔弄蝶","短紋孔弄蝶","長紋孔弄蝶","奇萊孔弄蝶","黯弄蝶","變紋黯弄蝶"]
    let name2 = ["豔粉蝶","白豔粉蝶","條斑艷粉蝶","黃裙艷粉蝶","流星絹粉蝶","白絹粉蝶","截脈絹粉蝶","白粉蝶","緣點白粉蝶","飛龍白粉蝶","淡褐脈粉蝶","黑脈粉蝶","鑲邊尖粉蝶","尖粉蝶","異色尖粉蝶","雲紋尖粉蝶","鋸粉蝶","纖粉蝶","異粉蝶","橙端粉蝶","細波遷粉蝶","遷粉蝶","黃裙遷粉蝶","紋黃蝶","圓翅鉤粉蝶","臺灣鉤粉蝶","星黃蝶","角翅黃蝶","淡色黃蝶","黃蝶","北黃蝶","島嶼黃蝶","亮色黃蝶"]
    let name3 = ["黃裳鳳蝶","珠光裳鳳蝶","曙鳳蝶","多姿麝鳳蝶","長尾麝鳳蝶","麝鳳蝶","紅珠鳳蝶","劍鳳蝶","黑尾劍鳳蝶","青鳳蝶","寬帶青鳳蝶","木蘭青鳳蝶","翠斑青鳳蝶","斑鳳蝶","黃星斑鳳蝶","大斑鳳蝶","臺灣寬尾鳳蝶","花鳳蝶","黃鳳蝶","柑橘鳳蝶","玉帶鳳蝶","黑鳳蝶","白紋鳳蝶","大白紋鳳蝶","無尾白紋鳳蝶","臺灣鳳蝶","大鳳蝶","翠鳳蝶","穹翠鳳蝶","雙環翠鳳蝶","臺灣琉璃翠鳳蝶","琉璃翠鳳蝶","烏鴉鳳蝶(亞種)"]
    let name4 = ["蚜灰蝶","熙灰蝶","銀灰蝶","臺灣銀灰蝶","紫日灰蝶","蔚青紫灰蝶","小紫灰蝶","日本紫灰蝶","暗色紫灰蝶","燕尾紫灰蝶","凹翅紫灰蝶","臺灣焰灰蝶","赭灰蝶","墨點灰蝶","線灰蝶","瓏灰蝶","朗灰蝶","珠灰蝶","鋩灰蝶","伏氏鋩灰蝶","阿里山鐵灰蝶","臺灣鐵灰蝶","臺灣榿翠灰蝶","碧翠灰蝶","黃閃翠灰蝶","小翠灰蝶","拉拉山翠灰蝶","霧社翠灰蝶","清金翠灰蝶","單線翠灰蝶","白芒翠灰蝶","夸父璀灰蝶","尖灰蝶","褐翅青灰蝶","白腹青灰蝶","漣紋青灰蝶","鈿灰蝶","蘭灰蝶","玳灰蝶","淡黑玳灰蝶","緣灰蝶","閃灰蝶","堇彩燕灰蝶","燕灰蝶","霓彩燕灰蝶","高砂燕灰蝶","臺灣灑灰蝶","秀灑灰蝶","田中灑灰蝶","江崎灑灰蝶","井上灑灰蝶","南方灑灰蝶","渡氏烏灰蝶","鑽灰蝶","小鑽灰蝶","拉拉山鑽灰蝶","三尾灰蝶","虎灰蝶","三斑虎灰蝶","蓬萊虎灰蝶","巒大鋸灰蝶","大娜波灰蝶","南方娜波灰蝶","熱帶娜波灰蝶","暗色娜波灰蝶","波灰蝶","密紋波灰蝶","雅波灰蝶","淡青雅波灰蝶","青珈波灰蝶","奇波灰蝶","豆波灰蝶","細灰蝶","藍灰蝶","莧藍灰蝶","折列藍灰蝶","單點藍灰蝶","迷你藍灰蝶","燕藍灰蝶","南方燕藍灰蝶","臺灣玄灰蝶","密點玄灰蝶","森灰蝶","藍丸灰蝶","黑丸灰蝶","黑星灰蝶","嫵琉灰蝶","白斑嫵琉灰蝶","靛色琉灰蝶","白紋琉灰蝶","琉灰蝶","杉谷琉灰蝶","大紫琉灰蝶","細邊琉灰蝶","寬邊琉灰蝶","白雀斑灰蝶","青雀斑灰蝶","綺灰蝶","蘇鐵綺灰蝶","東方晶灰蝶","白點褐蜆蝶","銀紋尾蜆蝶"]
    let name5 = ["東方喙蝶","虎斑蝶","金斑蝶","淡紋青斑蝶","小紋青斑蝶","絹斑蝶","斯氏絹斑蝶","大絹斑蝶","斑蝶","雙標紫斑蝶","異紋紫斑蝶","大紫斑蝶","圓翅紫斑蝶","小紫斑蝶","大白斑蝶","苧麻珍蝶","綠豹蛺蝶","熱帶豹蛺蝶","斐豹蛺蝶","琺蛺蝶","黃襟蛺蝶","眼蛺蝶","鱗紋眼蛺蝶","青眼蛺蝶","黯眼蛺蝶","南洋眼蛺蝶","波紋眼蛺蝶","枯葉蝶","黃帶隱蛺蝶","囊葉蝶","大紅蛺蝶","小紅蛺蝶","突尾鉤蛺蝶","黃鉤蛺蝶","琉璃蛺蝶","緋蛺蝶","散紋盛蛺蝶","花豹盛蛺蝶","雌擬幻蛺蝶","幻蛺蝶","端紫幻蛺蝶","波蛺蝶","豆環蛺蝶","小環蛺蝶","斷線環蛺蝶","細帶環蛺蝶","無邊環蛺蝶","蓬萊環蛺蝶","流紋環蛺蝶","眉紋環蛺蝶","深山環蛺蝶","蓮花環蛺蝶","槭環蛺蝶","鑲紋環蛺蝶","奇環蛺蝶","黑星環蛺蝶","單環蛺蝶","金環蛺蝶","殘眉線蛺蝶","玄珠帶蛺蝶","流帶蛺蝶","白圈帶蛺蝶","寬帶蛺蝶","幻紫帶蛺蝶","異紋帶蛺蝶","雙色帶蛺蝶","紫俳蛺蝶","瑙蛺蝶","紅玉翠蛺蝶","連珠翠蛺蝶","馬拉巴翠蛺蝶","臺灣翠蛺蝶","窄帶翠蛺蝶","網絲蛺蝶","流星蛺蝶","絹蛺蝶","白裳貓蛺蝶","金鎧蛺蝶","普氏白蛺蝶","白蛺蝶","燦蛺蝶","臺灣燦蛺蝶","紅斑脈蛺蝶","大紫蛺蝶","雙尾蛺蝶","小雙尾蛺蝶","箭環蝶","串珠環蝶","方環蝶","小波眼蝶","大藏波眼蝶","達邦波眼蝶","寶島波眼蝶","白漪波眼蝶","狹翅波眼蝶","密紋波眼蝶","江崎波眼蝶","白帶波眼蝶","王氏波眼蝶","巨波眼蝶","罕波眼蝶","文龍波眼蝶","古眼蝶","大幽眼蝶","圓翅幽眼蝶","玉山幽眼蝶","長紋黛眼蝶","波紋黛眼蝶","玉帶黛眼蝶","深山黛眼蝶","大深山黛眼蝶","曲紋黛眼蝶","臺灣黛眼蝶","柯氏黛眼蝶","月神黛眼蝶","巴氏黛眼蝶","孿斑黛眼蝶","黃斑蔭眼蝶","布氏蔭眼蝶","白斑蔭眼蝶","褐翅蔭眼蝶","眉眼蝶","淺色眉眼蝶","稻眉眼蝶","罕眉眼蝶","曲斑眉眼蝶","切翅眉眼蝶","小眉眼蝶","永澤蛇眼蝶","暮眼蝶","森林暮眼蝶","臺灣斑眼蝶","藍紋鋸眼蝶","玉帶蔭蝶"]
    var butterfly: Array<String> = []
    
    let image1 = ["s001","s002","s003","s004","s005","s007","s008","nullimage","nullimage","s013","nullimage","s016","nullimage","s018","nullimage","s021","nullimage",
                  "s023","s024","s026","s027","s029","s030","s031","nullimage","nullimage","s036","s037","s038","nullimage","s040",
                  "s041","s042","s043","s045","nullimage","s048","nullimage","s050","s051","nullimage","nullimage","s054","s055","s056",
                  "nullimage","s058","nullimage","nullimage","s061","s062","nullimage","nullimage","s065","s066","s067"]
    let image2 = ["s106","s107","nullimage","s109","s110","s111","nullimage","s113","s114","s115","s116","s117","s119","s120","s123","s124","s126","s128","s129",
                  "s130","s131","s132","nullimage","s134","s135","s136","s137","s138","s139","s140","s141","s142","s143"]
    let image3 = ["s069","nullimage","s072","s074","s075","nullimage","s077","s078","nullimage","s080","s081","s082","s083","s084","s085","nullimage","nullimage",
                  "s088","nullimage","nullimage","s091","s092","s093","s094","s095","s096","s097","s100","s101","s102","s104","s105","nullimage"]
    let image4 = ["s144","s145","s146","s147","s148","nullimage","s150","s151","nullimage","s155","s156","s157","nullimage","nullimage","nullimage","nullimage","nullimage",
                  "s166","s167","nullimage","s170","nullimage","s173","s175","s177","nullimage","nullimage","nullimage","nullimage","nullimage","nullimage","nullimage",
                  "nullimage","s186","s187","s188","s190","s191","s194","s196","s197","s198","nullimage","s200","s201","s202","s203","s204","nullimage","nullimage","nullimage",
                  "nullimage","s209","s210","nullimage","nullimage","nullimage","s214","s215","s216","s218","s219","s220","nullimage","s222","s223","s224","s227","s228",
                  "s229","s231","nullimage","s234","s235","s236","s237","s238","nullimage","s241","nullimage","nullimage","s244","s245","s246","nullimage","s248","s249",
                  "s250","s251","s252","s253","s254","nullimage","s256","s257","s258","nullimage","nullimage","s261","nullimage","s263","s264","s265","s266"]
    let image5 = ["s267","s270","s272","s273","s274","s276","s277","s278","s280","s281","s282","nullimage","s284","s285","s290","s291","s292","nullimage",
                  "s294","s296","s297","s300","s301","s302","s303","nullimage","nullimage","s306","nullimage","nullimage","s309","s310","s311","s312","s313","s314","s315","s316",
                  "s317","s318","nullimage","s320","s321","s322","s323","s324","s325","s326","nullimage","s328","s329","nullimage","nullimage",
                  "s332","s333","s335","nullimage","s337","s338","s340","s341","s342","s343","nullimage","s345","s346","s347","s348","s349","s350","nullimage","s352","s353","s355",
                  "s356","nullimage","s359","s360","nullimage","s363","s364","nullimage","s366","nullimage","s369","s370","s371","s372","s373","s374","s375","s376","s377",
                  "nullimage","s379","s380","s381","s382","nullimage","ss384","nullimage","nullimage","s387","s388","s389","s390","s391","nullimage","s393","s395","nullimage",
                  "s397","s398","s399","nullimage","s401","nullimage","s403","s404","nullimage","s406","s407","s408","s409","nullimage","nullimage",
                  "s412","nullimage","s414","nullimage","s416","s417","s418","nullimage"]
    var image: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get height & width of screen
        let screen_height = self.view.frame.height
        
        //計算高度和寬度單元
        let h = screen_height/14
        
        //設定標題
        navigationItem.title = text
        
        //設定TableView Cell的高度
        tableview.rowHeight = h*2
        
        switch text {
        case "弄蝶":
            butterfly = name1
            image = image1
            url = url1
        case "粉蝶":
            butterfly = name2
            image = image2
            url = url2
        case "鳳蝶":
            butterfly = name3
            image = image3
            url = url3
        case "灰蝶":
            butterfly = name4
            image = image4
            url = url4
        case "蛺蝶":
            butterfly = name5
            image = image5
            url = url5
        case "搜尋":
            for i in [name1, name2, name3, name4, name5] {
                var c = 0
                for j in i {
                    if j.contains(searchText!) == true {
                        butterfly.append(j)
                        
                        switch i {
                            case name1:
                                image.append(image1[c])
                                url.append(url1[c])
                            case name2:
                                image.append(image2[c])
                                url.append(url2[c])
                            case name3:
                                image.append(image3[c])
                                url.append(url3[c])
                            case name4:
                                image.append(image4[c])
                                url.append(url4[c])
                            case name5:
                                image.append(image5[c])
                                url.append(url5[c])
                            default:
                                print("OK")
                        }
                    }
                    c = c + 1
                }
            }
            
            if butterfly.count == 0 {
                butterfly.append("請輸入其他關鍵字")
                image.append("nullimage")
            }
            
        default:
            print("OK")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return butterfly.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ButterflyTableViewCell
        cell.butterflyImage.image = UIImage(named: image[indexPath.row])
        cell.nameLabel.text = butterfly[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ButterflyDetailViewController
        let indexPath = self.tableview.indexPathForSelectedRow
        controller?.urlStr = url[indexPath!.row]
    }
    
}
