//
//  ViewController.swift
//  1_KickTask
//
//  Created by Нечаев Михаил on 04.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let contentView = ContentView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.thirdButton.addTarget(self, action: #selector(openNewScreen), for: .touchDown)
    }

    @objc
    func openNewScreen() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }

}
