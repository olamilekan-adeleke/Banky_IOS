//
//  AccountSummaryHeader.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import Foundation
import UIKit

class AccountSummaryHeader: UITableViewHeaderFooterView {
    let imageAndIconHStack = UIStackView()
    let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let searchIcon = iconImageView(systemName: "")
    let bellIcon = iconImageView(systemName: "")

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryHeader {
    public func style() {
        contentView.backgroundColor = AppColor.primaryColor

        imageAndIconHStack.translatesAutoresizingMaskIntoConstraints = false

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "person")
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .systemTeal

        searchIcon.translatesAutoresizingMaskIntoConstraints = false

        bellIcon.translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
//        imageAndIconHStack.addArrangedSubview(profileImageView)
//        imageAndIconHStack.addArrangedSubview(searchIcon)
//        imageAndIconHStack.addArrangedSubview(bellIcon)
//        imageAndIconHStack.

        contentView.addSubview(imageAndIconHStack)

        // ImageAndIconHStack
        NSLayoutConstraint.activate([
            imageAndIconHStack.heightAnchor.constraint(equalToConstant: 144),
            imageAndIconHStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: imageAndIconHStack.trailingAnchor, multiplier: 1),
        ])

        // ProfileImage
//        NSLayoutConstraint.activate([
//            profileImageView.heightAnchor.constraint(equalToConstant: 40),
//            profileImageView.widthAnchor.constraint(equalToConstant: 40),
//        ])
    }
}

// Component
extension AccountSummaryHeader {
    private static func iconImageView(systemName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: systemName)
        return imageView
    }
}
