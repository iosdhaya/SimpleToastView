//
//  ToastView.swift
//  SwiftTutorial
//
//  Created by dhayaladevan on 12/02/16.
//  Copyright © 2016 dhayaladevan. All rights reserved.
//

import UIKit
import Foundation
//  ********  start from here  *********///


class ShowToast: NSObject {
    
    enum showPosition :Int
    {
        case Top
        case Center
        case Bottom
    }
    
    class func displayText(text:String,view:UIView,timePresent:Int,position:showPosition)->() {
        let tempview:TempView = TempView(frame:view.frame)
        view.addSubview(tempview)
        tempview.messageLabel.text = text
        switch position
        {
        case .Top:
            tempview.updateFramesForLabel(.Top)
            break;
        case .Bottom:
            tempview.updateFramesForLabel(.Bottom)
            break;
        default:
            tempview.updateFramesForLabel(.Center)
            break
        }
        
        let delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(timePresent) * Double(NSEC_PER_SEC)))
        dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), { () -> Void in
            tempview.removeFromSuperview()
        })
    }
}
// toast view
class TempView :UIView {
    
    enum showPosition :Int
    {
        case Top
        case Center
        case Bottom
    }
    
    var messageLabel = UILabel()
    override init(frame:CGRect){
        super.init(frame: frame)
        self.initCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initCustomView(){
        
        self.backgroundColor = UIColor.clearColor()
        addTextLabel(CGRectMake(10, self.bounds.height/2 - 40/2, self.bounds.width - 20, 40))
        
    }
    
    func addTextLabel(frame:CGRect){
        
        //let textLable:UILabel = UILabel(frame: frame)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.backgroundColor = UIColor(colorLiteralRed: (205/255), green: (51/255), blue: (51/255), alpha: 1)
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.numberOfLines = 0
        self .addSubview(messageLabel)
        addCustomLook()
    }
    
    func addCustomLook()
    {
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.layer.shadowColor = UIColor.blackColor().CGColor
        messageLabel.layer.shadowRadius = 10
        messageLabel.layer.masksToBounds = false
        messageLabel.layer.shadowOpacity = 1
        
    }
    
    func updateFramesForLabel(setPosition:showPosition)
    {
        let leadingContrains:NSLayoutConstraint = NSLayoutConstraint (item: messageLabel, attribute: .Leading, relatedBy: .Equal, toItem: messageLabel.superview, attribute: .Leading, multiplier: 1, constant: 10)
        
        let trailingContrains:NSLayoutConstraint = NSLayoutConstraint (item: messageLabel, attribute: .Trailing, relatedBy: .Equal, toItem: messageLabel.superview, attribute: .Trailing, multiplier: 1, constant: -10)
        
        let heightContrains:NSLayoutConstraint = NSLayoutConstraint (item: messageLabel, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem:nil, attribute: .Height, multiplier: 1, constant: 50)
        
        var potionContrains:NSLayoutConstraint?
        
        switch setPosition
        {
        case .Top:
            potionContrains = NSLayoutConstraint(item: messageLabel, attribute: .Top, relatedBy: .Equal, toItem:messageLabel.superview, attribute: .Top, multiplier: 1, constant: 50)
            break;
        case .Bottom:
            potionContrains = NSLayoutConstraint(item: messageLabel, attribute: .Bottom, relatedBy: .Equal, toItem:messageLabel.superview, attribute: .Bottom, multiplier: 1, constant: -50)
            break;
        default:
            potionContrains = NSLayoutConstraint (item: messageLabel, attribute: .CenterY, relatedBy: .Equal, toItem:messageLabel.superview, attribute: .CenterY, multiplier: 1, constant: 0)
            break
        }
        
        NSLayoutConstraint.activateConstraints([leadingContrains,trailingContrains,heightContrains,potionContrains!])
    }
    
}
// ******************* end ***************** //
