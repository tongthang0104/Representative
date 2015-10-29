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
    
    static func stateSearch(url: String, completion: (representatives: [Representative]) -> Void) {
        let urlString = NetworkController.searchURL(url)
        
        NetworkController.dataAtURL(urlString) { (resultData) -> Void in
            
            guard let resultData = resultData else {
                print("Error, data not received")
                completion(representatives: [])
                return
            }
            
            do {
                let repAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
                
                var representativeArray: [Representative] = []
                
                let repDictionary = repAnyObject[Representative.kResultsKey] as! [[String: String]]
                
                for dictionary in repDictionary {
                    let rep = Representative(jsonDictionary: dictionary)
                    representativeArray.append(rep)
                }
                    
                
                completion(representatives: representativeArray)
                
            } catch {
                print("Error serializing JSON")
                completion(representatives: [])
                return
            }
        }
        
    }
}