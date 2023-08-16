//
//  ViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 23/07/2023.
//

import UIKit

protocol LogOutDelegate: AnyObject {
    func didLogOut()
}

protocol LoginViewControllerDelegete: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    weak var delegate: LoginViewControllerDelegete?

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
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

    var titleLeadingAnchor: NSLayoutConstraint?
    var subtitleLeadingAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        button.configuration?.showsActivityIndicator = false
        loginView.clearForm()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateValue()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false

        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.tintColor = AppColor.primaryColor
        button.configuration?.imagePadding = 8
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Banky"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.alpha = 0

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Banking The Unbank Like They Do Say"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
    }

    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(button)
        view.addSubview(errorMesage)

        // TitleLabels
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1000)
        subtitleLeadingAnchor = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1000)
        titleLeadingAnchor?.isActive = true
        subtitleLeadingAnchor?.isActive = true
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),

            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 0.5),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        // LoginView
        NSLayoutConstraint.activate([
            loginView.heightAnchor.constraint(equalToConstant: 80),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
        ])

        // ButtonView
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 4),
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

    private func animateValue() {
        let animator = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = 16
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()

        let animator2 = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut) {
            self.subtitleLeadingAnchor?.constant = 16
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.25)

        let animator3 = UIViewPropertyAnimator(duration: 0.9 * 2, curve: .easeInOut) {
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.25)
    }
}

// MARK: - Actions

extension LoginViewController {
    @objc private func buttonTapped(_ sender: UIButton) {
        errorMesage.isHidden = true
        login()
    }

    private func login() {
//        delegate?.didLogin()

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
            delegate?.didLogin()
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
