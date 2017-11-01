//
//  JesonModel.swift
//  JsonExampleWithMVC
//
//  Created by Admin on 05/08/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import Foundation

class JesonModel
{
    
    func parseData(urlForData:String,completion:@escaping (_ dictionary:NSDictionary)->Void)
    {
        print("json parser activated")
        let urlPath = urlForData
        guard let endpoint = NSURL(string: urlPath) else {
            return
        }
        let request = NSMutableURLRequest(url:endpoint as URL)
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            do {
                
                
                let dictionary = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? NSDictionary;
               
                
                completion( dictionary!)
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
        
        
        
        
    }
    
   
    
    
    
    
    
    
}
