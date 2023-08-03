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
//    let searchIcon = iconImageView(systemName: "magnifyingglass")
    let searchIcon = iconImageView(systemName: "bell.fill")
    let bellIcon = iconImageView(systemName: "bell.fill")

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
        imageAndIconHStack.distribution = .equalSpacing

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "person")
        profileImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true

//        profileImageView.layer.cornerRadius = frame.width / 2
//        profileImageView.clipsToBounds = true
//        profileImageView.backgroundColor = .systemTeal

        searchIcon.translatesAutoresizingMaskIntoConstraints = false
//        searchIcon.frame.size.height = 32
//        searchIcon.frame.size.width = 32
//        searchIcon.contentMode = .scaleToFill

        bellIcon.translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
        let iconStack = UIStackView(arrangedSubviews: [searchIcon, bellIcon])
        iconStack.translatesAutoresizingMaskIntoConstraints = false
        iconStack.axis = .horizontal
//        iconStack.distribution = .

        imageAndIconHStack.addArrangedSubview(profileImageView)
        imageAndIconHStack.addArrangedSubview(iconStack)

        addSubview(imageAndIconHStack)

        // ImageAndIconHStack
        NSLayoutConstraint.activate([
            iconStack.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1),
            // imageAndIconHStack.heightAnchor.constraint(equalToConstant: 50),
            imageAndIconHStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: imageAndIconHStack.trailingAnchor, multiplier: 1),

            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
//
//            searchIcon.heightAnchor.constraint(equalToConstant: 32),
//            searchIcon.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
}

// Component
extension AccountSummaryHeader {
    private static func iconImageView(systemName: String) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: systemName)?.withRenderingMode(.alwaysTemplate)
        view.addSubview(imageView)
        return view
    }
}
