//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Daniel Lee on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let sharedInstance = RepresentativeController()
    
    static func stateSearch(url: String, completion: (result: Representative?) -> Void) {
        let urlString = NetworkController.searchURL(url)
        
        NetworkController.dataAtURL(urlString) { (resultData) -> Void in
            
            guard let resultData = resultData else {
                print("Error, data not received")
                completion(result: nil)
                return
            }
            
            do {
                let repAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var representative: Representative?
                
                if let repDictionary = repAnyObject as? [String: String] {
                    representative = Representative(jsonDictionary: repDictionary)
                }
                completion(result: representative)
                
            } catch {
                completion(result: nil)
                
            }
        }
        
    }
}