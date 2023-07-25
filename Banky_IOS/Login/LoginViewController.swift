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

    lazy var errorMesage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .systemRed
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    var username: String? { loginView.usernameTextField.text }
    var password: String? { loginView.passwordTextField.text }

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
        view.addSubview(errorMesage)

        // LoginView
        NSLayoutConstraint.activate([
            loginView.heightAnchor.constraint(equalToConstant: 80),
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

        // ErrorMessageLabel
        NSLayoutConstraint.activate([
            errorMesage.topAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 2),
            errorMesage.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMesage.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

// MARK: - Actions

extension LoginViewController {
    @objc private func buttonTapped(_ sender: UIButton) {
        errorMesage.isHidden = true
        login()
    }

    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nill")
            return
        }

        if username.isEmpty || password.isEmpty {
            showErrorMessage(withMessage: "Username / Password can not be blank")
            return
        }

        if username == "Kod-x" && password == "Welcome" {
            button.configuration?.showsActivityIndicator = true
        } else {
            button.configuration?.showsActivityIndicator = false
            showErrorMessage(withMessage: "Incorrect username / password!")
        }
    }

    private func showErrorMessage(withMessage message: String) {
        errorMesage.isHidden = false
        errorMesage.text = message
    }
}
