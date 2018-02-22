//
//  CAAnimationDelegate.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit

//public typealias CAAnimationCallback = (CAAnimation, Bool) -> ();

/*
public class CAAnimationDelegate: NSObject {
    var onStartCallback:CAAnimationCallback?
    var onCompleteCallback:CAAnimationCallback?
    
    override public func animationDidStart(anim: CAAnimation) {
        if let startHandler = onStartCallback {
            startHandler(anim, true);
        }
    }
    
    override public func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if let completionHandler = onCompleteCallback {
            completionHandler(anim, flag);
        }
    }
  
}


public extension CAAnimation {
    // See if there is already a CAAnimationDelegate handling this animation
    // If there is, add onStart to it, if not create one
    func setonStartCallbackBlock(callback:CAAnimationCallback) {
        if let myDelegate = delegate {
            if(myDelegate.isKindOfClass(CAAnimationDelegate)) {
                let myThing = myDelegate as! CAAnimationDelegate;
                myThing.onStartCallback = callback;
            }
        } else {
            let callbackDelegate = CAAnimationDelegate();
            callbackDelegate.onStartCallback = callback;
            self.delegate = callbackDelegate;
        }
    }
    
    // See if there is already a CAAnimationDelegate handling this animation
    // If there is, add onCompletion to it, if not create one
    func setCompletionBlock(callback:CAAnimationCallback) {
        if let myDelegate = delegate {
            if(myDelegate.isKindOfClass(CAAnimationDelegate)) {
                let myThing = myDelegate as! CAAnimationDelegate;
                myThing.onCompleteCallback = callback;
            }
        } else {
            let callbackDelegate = CAAnimationDelegate();
            callbackDelegate.onCompleteCallback = callback;
            self.delegate = callbackDelegate;
        }
    }
}


*/



