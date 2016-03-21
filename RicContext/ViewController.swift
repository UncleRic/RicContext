//  ViewController.swift
//  RicContext
//
//  Created by Frederick C. Lee on 3/20/16.
//  Copyright © 2016 Swift International. All rights reserved.
// -----------------------------------------------------------------------------------------------------

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

    // -----------------------------------------------------------------------------------------------------
    // MARK: - Action methods
    
    
    @IBAction func exitAction(sender: UIBarButtonItem) {
        exit(0)
    }

}

