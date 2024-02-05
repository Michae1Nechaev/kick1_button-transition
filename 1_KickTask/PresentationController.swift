//
//  PresentationController.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 05.02.2024.
//

import UIKit

class PresentationController: UIPresentationController {
    
    override var shouldPresentInFullscreen: Bool {
            return false
        }
        
        override var frameOfPresentedViewInContainerView: CGRect {
            let bounds = containerView!.bounds
            let partHeight = bounds.height - 100
            return CGRect(x: 0,
                          y: 100,
                          width: bounds.width,
                          height: partHeight)
        }
        
        override func presentationTransitionWillBegin() {
            super.presentationTransitionWillBegin()
            
            containerView?.addSubview(presentedView!)
            
        }
        
        override func containerViewDidLayoutSubviews() {
            super.containerViewDidLayoutSubviews()
            
            presentedView?.frame = frameOfPresentedViewInContainerView
        }
        
        var driver: TransitionDriver!
        override func presentationTransitionDidEnd(_ completed: Bool) {
            super.presentationTransitionDidEnd(completed)
            
            if completed {
                driver.direction = .dismiss
            }
        }
    
}
