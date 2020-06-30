//
//  ViewController.swift
//  Youtube
//
//  Created by Erdem Koçer on 30.06.2020.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()
        
        
    }


}

