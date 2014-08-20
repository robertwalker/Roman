//
//  ViewController.swift
//  Roman
//
//  Created by Robert Walker on 8/14/14.
//  Copyright (c) 2014 Robert Walker. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var decimalTextField: NSTextField!
    @IBOutlet weak var romanTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func convert(sender: AnyObject) {
        let formatter = RomanNumeralFormatter()
        
        let decimal = self.decimalTextField.integerValue
        if let roman = formatter.stringForInteger(decimal) {
            self.romanTextField.stringValue = roman
        }
        else {
            self.romanTextField.stringValue = "Invalid Number! Try again."
        }
    }
}
