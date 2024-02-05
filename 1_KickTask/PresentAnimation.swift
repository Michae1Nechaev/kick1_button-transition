//
//  PresentAnimation.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 05.02.2024.
//

import UIKit

class PresentAnimation: NSObject {
    let duration: TimeInterval = 0.3

    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {

        let to = transitionContext.view(forKey: .to)!
        let from = transitionContext.viewController(forKey: .from)!
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!) 
        
        to.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            to.frame = finalFrame // Возвращаем на место, так он выезжает снизу
            from.view.layer.cornerRadius = 10
            from.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            from.view.frame.origin.y = 64
        }

        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        return animator
    }
}

extension PresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }
}
