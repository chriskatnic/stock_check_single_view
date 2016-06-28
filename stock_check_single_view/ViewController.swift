//
//  ViewController.swift
//  stock_check_single_view
//
//  Created by Christopher Katnic on 9/30/15.
//  Copyright © 2015 Christopher Katnic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var results_view: UITextView!
    
    var query : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func check(sender: AnyObject) {
       
        query = "select * from yahoo.finance.quotes where symbol = \"\(input.text!)\""
        print("Query: \(query)")
        let results = YQL.query(query)
        let queryResults = results?.valueForKeyPath("query.results") as! NSDictionary?
        if queryResults != nil {
            print( "query.results: \(queryResults)" )
            results_view.text = queryResults!.description
        }
        else {
            print("Found nothing")
        }
        
        
        
    }

    
}

