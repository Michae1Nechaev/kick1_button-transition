//
//  ContentView.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 06.02.2024.
//

import UIKit

final class ContentView: UIView {
    
    lazy var firstButton = createButton(with: "Первая")
    lazy var secondButton = createButton(with: "Вторая побольше")
    lazy var thirdButton = createButton(with: "Третья проверка на адаптив")
    
    private let imageName = "arrow.right.circle"

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            [firstButton, secondButton, thirdButton].forEach {
                $0.backgroundColor = .systemGray2
                $0.tintColor = .systemGray3
                $0.setTitleColor(.systemGray3, for: .normal)
            }
        } else {
            [firstButton, secondButton, thirdButton].forEach {
                $0.backgroundColor = .systemBlue
                $0.tintColor = .white
                $0.setTitleColor(.white, for: .normal)
            }
        }
    }
}

private extension ContentView {
    
    func setupLayout() {
        [firstButton, secondButton, thirdButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            firstButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16),
            secondButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16),
            thirdButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func createButton(with title: String) -> NMButton {
        let button = NMButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .highlighted)
        button.setImage(UIImage(systemName: imageName), for: .selected)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.tintAdjustmentMode = .dimmed
        return button
    }

}
