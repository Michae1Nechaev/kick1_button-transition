//
//  DismissAnimation.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 05.02.2024.
//

import UIKit

class DismissAnimation: NSObject {
    let duration: TimeInterval = 0.3

    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let from = transitionContext.view(forKey: .from)!
        let to = transitionContext.viewController(forKey: .to)!
        let initialFrame = transitionContext.initialFrame(for: transitionContext.viewController(forKey: .from)!)

        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            from.frame = initialFrame.offsetBy(dx: 0, dy: initialFrame.height)
            to.view.layer.cornerRadius = 0
            to.view.transform = .identity
            to.view.frame.origin.y = 0
        }

        animator.addCompletion { [weak transitionContext] (position) in
            if let parentVC = transitionContext?.viewController(forKey: .to) as? ViewController {
                if !transitionContext!.transitionWasCancelled {
                    parentVC.enableControls()
                }
            }
            transitionContext?.completeTransition(!transitionContext!.transitionWasCancelled)
        }

        return animator
    }
}

extension DismissAnimation: UIViewControllerAnimatedTransitioning {
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
