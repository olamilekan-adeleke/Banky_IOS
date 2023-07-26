//
//  OnboardingViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 26/07/2023.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    let stackView = UIStackView()

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

    let imageString: String
    let titleText: String
    let subtitleText: String

    init(image: String, title: String, subtitle: String) {
        self.imageString = image
        self.titleText = title
        self.subtitleText = subtitle

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        style()
        layout()
    }
}

extension OnboardingViewController {
    public func style() {
        view.backgroundColor = .systemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageString)
        imageView.clipsToBounds = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = titleText
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        subtitleLabel.text = subtitleText
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
    }

    public func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.setCustomSpacing(20, after: imageView)

        stackView.addArrangedSubview(titleLabel)
        stackView.setCustomSpacing(5, after: titleLabel)
        stackView.addArrangedSubview(subtitleLabel)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 250),
        ])

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
        ])
    }
}
