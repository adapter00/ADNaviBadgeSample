//
//  ViewController.swift
//  NaviIconNotificationSample
//
//  Created by adapter00 on 2015/09/19.
//  Copyright (c) 2015年 adapter00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.backgroundColor = UIColor.brownColor()
        
       let leftB = UIBarButtonItem(customView: ADNaviBadge(frame:CGRectMake(0, 0, 44, 44)))
        navigationItem.leftBarButtonItem = leftB
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BadgeAction(sender: AnyObject) {
        //post notification everywhere
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: ADNaviBadge.notificationKey, object: nil))
    }
}

