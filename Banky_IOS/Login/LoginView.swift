//
//  LoginView.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 23/07/2023.
//

import Foundation
import UIKit

class LoginView: UIView {
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordIcon = UIImageView()

    let stackView = UIStackView()
    let divider = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    public func style() {
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self

        // Password Icon
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        passwordIcon.image = UIImage(systemName: "eye")
        passwordIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(passwordIocnTapped)))
        passwordIcon.tintColor = UIColor.gray.withAlphaComponent(0.7)
        passwordIcon.contentMode = .scaleAspectFit
        passwordIcon.isUserInteractionEnabled = true

        // Password TextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.rightView = passwordIcon
        passwordTextField.rightViewMode = .always
//        passwordTextField.addSubview(passwordIcon)

        // Divider
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
    }

    public func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTextField)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])

//        NSLayoutConstraint.activate([
//            passwordIcon.heightAnchor.constraint(equalToConstant: 25),
//            passwordIcon.widthAnchor.constraint(equalToConstant: 25),
//            passwordIcon.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
//            passwordIcon.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
//        ])

        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {}
}

// MARK: - Actions

extension LoginView {
    @objc private func passwordIocnTapped() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordIcon.image = UIImage(systemName: "eye.slash")
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordIcon.image = UIImage(systemName: "eye")
        }
    }

    func clearForm() {
        usernameTextField.text = ""
        passwordTextField.text = ""
        passwordTextField.isSecureTextEntry = false
        passwordIcon.image = UIImage(systemName: "eye")
    }
}
