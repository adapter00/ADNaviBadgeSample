//
//  ADNaviBadge.swift
//  NaviIconNotificationSample
//
//  Created by adapter00 on 2015/09/19.
//  Copyright (c) 2015年 adapter00. All rights reserved.
//

import Foundation
import UIKit

class ADNaviBadge: UIButton {
    static let notificationKey = "adBadgeShowingKey"
    var badge: UILabel?
    var image: UIImage?
    var isShowingBadge: Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBadge()
        hideBadge()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpBadge()
        self.addSubview(badge!)
    }
    
    //setupBadge
    func setUpBadge(){
        let scale = 0.38
        //create UILabel for badge view
        badge = UILabel(frame:CGRectMake(self.frame.width - self.frame.width * CGFloat(scale), 0, self.frame.width * CGFloat(scale), self.frame.height * CGFloat(scale)))
        badge!.clipsToBounds = true
        badge!.layer.cornerRadius = badge!.frame.width / 2
        badge!.backgroundColor = UIColor.redColor()
        badge!.text = "N"
        badge!.textAlignment = .Center
        badge!.textColor = UIColor.whiteColor()
        badge!.font = UIFont.boldSystemFontOfSize(13)
        image = UIImage(named: "bulb_off.png")
        let imageView = UIImageView(image: image)
        imageView.center = self.center
        //setup autolayout
        self.addSubview(imageView)
        self.addSubview(self.badge!)
        badge!.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateBadgeStatus:", name: ADNaviBadge.notificationKey, object: nil)
    }
    
    func updateBadgeStatus(notification: NSNotification?) {
        if self.isBadge() {
            hideBadge()
        }else {
            showBadge()
        }
    }
    
    //show badge with animation
    func showBadge() {
        if let b = badge {
                b.hidden = false
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                b.transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.isShowingBadge = true
            })
        }
    }
    
    //hide badge with animation
    func hideBadge() {
        if let b = badge {
            UIView.animateWithDuration(0.6, delay: 0, options: .TransitionNone, animations: { () -> Void in
                b.transform = CGAffineTransformMakeScale(0.1, 0.1)
            }, completion: { (stop) -> Void in
                b.hidden = true
                self.isShowingBadge = false
            })
        }
    }
    
    //whether badge is showing
    func isBadge() -> Bool {
        if let b = isShowingBadge {
            if b {
                return true
            } else {
                return false
            }
        }
        return false
    }
}
