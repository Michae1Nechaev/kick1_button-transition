//
//  ViewController.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 04.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var firstButton = createButton(with: "Первая")
    private lazy var secondButton = createButton(with: "Вторая побольше")
    private lazy var thirdButton = createButton(with: "Третья проверка на адаптив")
    
    private let imageName = "arrow.right.circle"

    private let transition = NativeTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [firstButton, secondButton, thirdButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        thirdButton.addTarget(self, action: #selector(openNewScreen), for: .touchDown)
    }
    
    private func createButton(with title: String) -> NMButton {
        let button = NMButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .highlighted)
        button.setImage(UIImage(systemName: imageName), for: .selected)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }

    @objc
    func openNewScreen() {
        let vc = TopViewController()
        vc.view.backgroundColor = .white
        [firstButton, secondButton, thirdButton].forEach {
            $0.backgroundColor = .systemGray2
            $0.tintColor = .systemGray3
            $0.setTitleColor(.systemGray3, for: .normal)
        }
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .custom
        present(vc, animated: true)
    }
    
    func enableControls() {
        [firstButton, secondButton, thirdButton].forEach {
            $0.backgroundColor = .systemBlue
            $0.tintColor = .white
            $0.setTitleColor(.white, for: .normal)
        }
    }

}
