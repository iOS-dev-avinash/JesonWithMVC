//
//  ViewController.swift
//  JsonExampleWithMVC
//
//  Created by Admin on 05/08/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jes = JesonModel();
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        jes.parseData(urlForData: "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json") { (dictionary) in
            print(dictionary)
        }
        
        DispatchQueue.main.async {
            print("fgjcghvhvhjhhhh")
        }
        
        
        
    }

    


}

