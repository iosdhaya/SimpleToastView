//
//  ViewController.swift
//  SwiftTutorial
//
//  Created by dhayaladevan
//  Copyright © 2016 dhayaladevan All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func buttonActionTop() -> ()
    {
        ShowToast.displayText("You can show your text here..", view: self.view,timePresent: 1,position: .Top)
    }
    @IBAction func buttonActionCenter() -> ()
    {
        ShowToast.displayText("You can show your text here..", view: self.view,timePresent: 2,position: .Center)
    }
    @IBAction func buttonActionBottom() -> ()
    {
        ShowToast.displayText("You can show your text here..", view: self.view,timePresent: 1,position: .Bottom)
    }
}
