//
//  AccountSummaryHeader.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import SwiftUI
import UIKit

class AccountSummaryHeader: UIView {
    static let height: CGFloat = 100

    let profileImageView = makeImage(named: "person")
    let bellIcon = ShakeyBellView()
    let logOutIcon = iconImageView(systemName: "rectangle.portrait.and.arrow.forward")

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 144)
    }
}

extension AccountSummaryHeader {
    public func style() {
        backgroundColor = UIColor.gray.withAlphaComponent(0.5)

        logOutIcon.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        logOutIcon.addGestureRecognizer(tapGestureRecognizer)

        bellIcon.translatesAutoresizingMaskIntoConstraints = false
//        bellIcon.backgroundColor = .yellow

        addSubview(logOutIcon)
        addSubview(bellIcon)
    }

    public func layout() {
        NSLayoutConstraint.activate([
            logOutIcon.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logOutIcon.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),

            bellIcon.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: bellIcon.trailingAnchor, multiplier: 0),
        ])
    }
}

struct AccountSummaryHeaderRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return AccountSummaryHeader()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct AccountSummaryHeader_Preview: PreviewProvider {
    static var previews: some View {
        return AccountSummaryHeaderRepresentable()
    }
}

// MARK: - Actions

extension AccountSummaryHeader {
    @objc private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name.logOut, object: nil)
    }
}
