//
//  YQLQuery.swift
//  stock_check_single_view
//
//  Created by Christopher Katnic on 9/30/15.
//  Copyright © 2015 Christopher Katnic. All rights reserved.
//

import Foundation
struct YQL {
    private static let prefix:NSString = "http://query.yahooapis.com/v1/public/yql?&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=&q="
    
    static func query(statement:String) -> NSDictionary? {
        
        let escapedStatement = statement.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        let query = "\(prefix)\(escapedStatement!)"
        
        var results:NSDictionary? = nil
        let jsonError:NSError? = nil
        
        let jsonData = NSData(contentsOfURL: NSURL(string: query)!)//, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &jsonError)
        
        if jsonData != nil {
            //results = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments, error: &jsonError) as NSDictionary?
            
            do {
               results = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
            }
            catch let error as NSError {
                print(error)
            }
        }
        if jsonError != nil {
            NSLog( "ERROR while fetching/deserializing YQL data. Message \(jsonError!)" )
        }
        return results
    }
}


