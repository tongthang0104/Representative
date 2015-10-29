//
//  SearchViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var repResult: [Representative] = []
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return states[row]
        
    }
   
    @IBAction func searchButtonTapped(sender: UIButton) {
        
        let index = self.pickerView.selectedRowInComponent(0)
        
        let stateString = self.states[index]
        
        RepresentativeController.stateSearch(stateString) { (representatives) in
            
            if representatives.count > 0 {
                self.repResult = representatives
                dispatch_async(dispatch_get_main_queue(), {
                    () -> Void in
                    self.performSegueWithIdentifier("showRep", sender: self)
                })
            }
        
        }
    }
    
    
    
}
