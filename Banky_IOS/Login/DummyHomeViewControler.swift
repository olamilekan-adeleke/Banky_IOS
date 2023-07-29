////
////  DummyHomeViewControler.swift
////  Banky_IOS
////
////  Created by Enigma Kod on 27/07/2023.
////
//
//import Foundation
//import UIKit
//
//class DummyHomeViewControler: UIViewController {
//    weak var logOurDelegate: LogOutDelegate?
//
//    let stackView = UIStackView()
//    let labelView = UILabel()
//    let logOutButton = UIButton(type: .system)
//
//    override func viewDidLoad() {
//        style()
//        layout()
//    }
//}
//
//extension DummyHomeViewControler {
//    public func style() {
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 20
//
//        labelView.translatesAutoresizingMaskIntoConstraints = false
//        labelView.text = "Hello, World!"
//        labelView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//
//        logOutButton.translatesAutoresizingMaskIntoConstraints = false
//        logOutButton.configuration = .filled()
//        logOutButton.setTitle("Log Out", for: .normal)
//        logOutButton.addTarget(self, action: #selector(logOutPressed), for: .primaryActionTriggered)
//    }
//
//    public func layout() {
//        stackView.addArrangedSubview(labelView)
//        stackView.addArrangedSubview(logOutButton)
//
//        view.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
//    }
//
//    @objc private func logOutPressed(_ sender: UIButton) {
//        logOurDelegate?.didLogOut()
//    }
//}
