//
//  ViewController.swift
//  IPPrac
//
//  Created by Chun-Li Cheng on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var wanIPLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WANIPGetter.getPublicIP { string in
            self.wanIPLabel.text = string
        }
        
        
        
    }


}

