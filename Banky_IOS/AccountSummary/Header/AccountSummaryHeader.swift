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
        imageAndIconHStack.axis = .horizontal

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "person")
//        profileImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        profileImageView.layer.cornerRadius = frame.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .systemTeal

        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        
//
//        bellIcon.translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
        imageAndIconHStack.addArrangedSubview(profileImageView)
        imageAndIconHStack.addArrangedSubview(searchIcon)
//        imageAndIconHStack.addArrangedSubview(bellIcon)

        addSubview(imageAndIconHStack)

        // ProfileImage
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
        ])
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
