//
//  ViewController.swift
//  LoggerApp
//
//  Created by khaled mohamed el morabea on 2/23/20.
//  Copyright © 2020 Instabug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let logger = Logger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...6000 {
            let recordeLog = Logger.shared.log(message: "UserLogger", level: .Verbose)
            print(recordeLog ? "Logged Succesfuly" : "Limit Exceeds")
            print(i)
        }
    }


}

