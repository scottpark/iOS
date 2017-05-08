//
//  PreAuthViewController.swift
//  imagineertalk
//
//  Created by Scott on 5/5/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit

class PreAuthViewController: UIViewController {

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let authViewController = segue.destination as! AuthViewController
        
        if segue.identifier == "LoginSegue" {
            authViewController.isLogin = true
        } else {
            authViewController.isLogin = false
        }
    }

}
