//
//  AccountSummaryHeader.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import Foundation
import UIKit

class AccountSummaryHeader: UIView {
    static let height: CGFloat = 100

    let imageAndIconHStack = UIStackView()
    let profileImageView = UIImageView()
    let searchIcon = iconImageView(systemName: "")
    let bellIcon = iconImageView(systemName: "")

//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//
//    }

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

extension AccountSummaryHeader {
    public func style() {
        backgroundColor = UIColor.gray.withAlphaComponent(0.1)

        imageAndIconHStack.translatesAutoresizingMaskIntoConstraints = false

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "person")!
        profileImageView.image = image
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.frame.size.height = 50
        profileImageView.frame.size.width = 50
//        profileImageView.layer.cornerRadius = frame.width / 2
//        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .systemTeal

//        searchIcon.translatesAutoresizingMaskIntoConstraints = false
//
//        bellIcon.translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
//        imageAndIconHStack.addArrangedSubview(profileImageView)
//        imageAndIconHStack.addArrangedSubview(searchIcon)
//        imageAndIconHStack.addArrangedSubview(bellIcon)
//        imageAndIconHStack.

        addSubview(profileImageView)

        // ImageAndIconHStack
//        NSLayoutConstraint.activate([
//            imageAndIconHStack.heightAnchor.constraint(equalToConstant: 144),
//            imageAndIconHStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
//            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: imageAndIconHStack.trailingAnchor, multiplier: 1),
//        ])

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
