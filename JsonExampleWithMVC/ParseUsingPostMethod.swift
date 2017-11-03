//
//  ParseUsingPostMethod.swift
//  JsonExampleWithMVC
//
//  Created by Admin on 12/08/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import UIKit
import SystemConfiguration

    
    func loadingJSON(_ link:String, postString:String, completionHandler: @escaping (_ JSONObject: AnyObject) -> ()) {
        if(isInterntConnectedToNetwork() == false){
            completionHandler("-1" as AnyObject)
            return
        }
        
        let request = NSMutableURLRequest(url: URL(string: link)!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            
            //JSON successfull
            do {
                
                let parseJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                
                DispatchQueue.main.async(execute: {
                    completionHandler(parseJSON as AnyObject)
                });
                
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                
            }
        }
        task.resume()
    }
    

    func isInterntConnectedToNetwork() -> Bool
    {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    



