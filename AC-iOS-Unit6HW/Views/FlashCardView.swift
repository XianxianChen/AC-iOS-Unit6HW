//
//  FlashCardView.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

public enum FlipAnimations
{
    case flipFromLeft
    case flipFromRight
    case flipFromTop
    case flipFromBottom
    
    func animationOption() -> UIViewAnimationOptions
    {
        switch self
        {
        case .flipFromLeft:
            return .transitionFlipFromLeft
        case .flipFromRight:
            return .transitionFlipFromRight
        case .flipFromTop:
            return .transitionFlipFromTop
        case .flipFromBottom:
            return .transitionFlipFromBottom
        }
    }
}
@objc protocol FlashCardDelegate {
   func flipFrontView(forFlashCard flashCardView: FlashCardView) -> UIView
    func flipBackView(forFlashCard flashCardView: FlashCardView) -> UIView
    @objc optional func flashCardWillFlip(forFlashCard flashCardView: FlashCardView)
    @objc optional func flashCardDidFlip(forFlashCard flashCardView: FlashCardView)
    
}
class FlashCardView: UIView {

    var animationInProgress:Bool = false
    var tapToFlipGesture:UITapGestureRecognizer?
    var flipAnimation: FlipAnimations = .flipFromLeft
    var duration:Double = 1.0
     open var showFront:Bool = true
 
    weak var delegate: FlashCardDelegate?
    var frontView: UIView?
    var backView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTapFlipGuesture()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTapFlipGuesture()
    }
    
    func setupTapFlipGuesture() {
    if let tapGesture = tapToFlipGesture
    {
    tapGesture.isEnabled = true
    } else {
    tapToFlipGesture = UITapGestureRecognizer(target: self, action: #selector(flip))
    self.addGestureRecognizer(tapToFlipGesture!)
    }
    }
    func setupFrontAndBackView() {
        if let delegate = self.delegate {
            frontView = delegate.flipFrontView(forFlashCard: self)
            backView = delegate.flipBackView(forFlashCard: self)
            backView?.isHidden = true
            frontView?.isHidden = false
        }
    }
    @objc func flip() {
        // setup views before animation
        if !animationInProgress {
            self.setupFrontAndBackView()
            if frontView != nil && backView != nil {
                if let delegate = self.delegate {
                    if delegate.flashCardWillFlip != nil {
                        delegate.flashCardWillFlip!(forFlashCard: self)
                    }
                }
                let fromView = showFront ? frontView : backView
                let toView = showFront ? backView : frontView
                backView?.isHidden = showFront // hide backView if frontView is showing
                animationInProgress = true // start to animate
                UIView.transition(from: fromView!, to: toView!, duration: duration, options: [flipAnimation.animationOption(), .showHideTransitionViews], completion: { (finish) in
                    self.animationInProgress = false
                    if finish {
                        self.showFront = !self.showFront // if finish, the views switched
                        self.backView?.isHidden = self.showFront
                        if let delegate = self.delegate {
                            if delegate.flashCardDidFlip != nil {
                                delegate.flashCardDidFlip!(forFlashCard: self)
                            }
                        }
                    }
                })
                
            }
        }
    }
    
    
    

}
