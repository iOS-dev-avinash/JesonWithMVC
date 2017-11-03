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
        
       
        
        /*jes.parseData(urlForData: "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json") { (dictionary) in
            print(dictionary)
        }
        
        DispatchQueue.main.async {
            print("fgjcghvhvhjhhhh")
        }*/
        let userEmail = "";
        let password = "1234";
        
     /*   loadingJSON("yourDomain.com/login.php", postString:"email=\(userEmail)&password=\(password)") {
            parseJSON in
            
            if(String(describing: parseJSON) == "-1"){
                print("No Internet")
            } else {
                
                if let loginSuccessfull = parseJSON["loginSuccessfull"] as? Bool {
                    //... do stuff
                }
            }
        
        
    }*/
        
       // loadingJSONUsingGetMethod

        loadingJSONUsingGetMethod("https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json", postString:"") {
            parseJSON in
            
            if(String(describing: parseJSON) == "-1"){
                print("No Internet")
            } else {
                
                print("data==",parseJSON)
                
                if let loginSuccessfull = parseJSON["loginSuccessfull"] as? Bool {
                    //... do stuff
                    
                }
            }
            
            
        }


}
}

