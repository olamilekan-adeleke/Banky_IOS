//
//  ViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 23/07/2023.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false

        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    }

    private func layout() {
        view.addSubview(loginView)
        view.addSubview(button)

        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
        ])

        // ButtonView
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            button.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

// MARK: - Actions

extension LoginViewController {
    @objc private func buttonTapped(_ sender: UIButton) {}
}
