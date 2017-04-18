//
//  ViewController.swift
//  diary
//
//  Created by Scott on 15/04/2017.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // @IBOutlet weak var textInput: UITextField!
    // @IBOutlet weak var textInput2: UITextField!
    // @IBOutlet weak var textInput: UILabel!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textArea: UITextView!
    
    // @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let text = textInput.text
        textLabel.text = text
        
        let content = textArea.text
        contentLabel.text = content
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

