//
//  NetworkController.swift
//  Representatives
//
//  Created by Daniel Lee on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {

    static func searchURL(state: String) -> NSURL {
        
        let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php?state=\(state)"
        return NSURL(string: baseURL)!
        
    }
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void ) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
             print(data)
            
            completion(resultData: data)
        
           
        }
        
        dataTask.resume()
    }
    
    
}
