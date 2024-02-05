//
//  NMButton.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 04.02.2024.
//

import UIKit

final class NMButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            startPulseAnimation()
        }
    }
    
    private var imageViewWidth: CGFloat {
        imageView?.frame.width ?? 0
    }
    
    private var titleLabelWidth: CGFloat {
        titleLabel?.frame.width ?? 0
    }
        
    override var intrinsicContentSize: CGSize {
        let labelFittingSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let imageFittingSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let titleLabelSize = titleLabel?.sizeThatFits(labelFittingSize) ?? .zero
        let imageViewSize = imageView?.sizeThatFits(imageFittingSize) ?? .zero
        let size = CGSize(width: 14 + titleLabelSize.width + 8 + imageViewSize.width + 14, height: 20 + titleLabelSize.height)
        return size
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 6
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageViewWidth - 14 - 14,
            bottom: 0,
            right: 0
        )
        imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 14 + titleLabelWidth + 8,
            bottom: 0,
            right: 0
        )
    }
    
    private func startPulseAnimation() {
        let scaling = CABasicAnimation(keyPath: "transform.scale")
        scaling.toValue = 0.6
        scaling.duration = 0.2
        scaling.autoreverses = true
        scaling.repeatCount = .zero
        scaling.isRemovedOnCompletion = false
        layer.add(scaling, forKey: nil)
    }
    
}

