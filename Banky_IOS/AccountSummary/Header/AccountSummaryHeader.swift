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

    let imageAndIconHStack = makeStack(axis: NSLayoutConstraint.Axis.horizontal)
    let profileImageView = makeImage(named: "person")
    let searchIcon = iconImageView(systemName: "magnifyingglass")
    let bellIcon = iconImageView(systemName: "bell.fill")

    let spacer = makeHSpacer(width: 20)

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

        spacer.backgroundColor = .red

        imageAndIconHStack.addArrangedSubview(profileImageView)
        imageAndIconHStack.isLayoutMarginsRelativeArrangement = true
        imageAndIconHStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5)

        imageAndIconHStack.addArrangedSubview(spacer)
        imageAndIconHStack.addArrangedSubview(searchIcon)
        imageAndIconHStack.addArrangedSubview(bellIcon)

        imageAndIconHStack.setCustomSpacing(10, after: searchIcon)

        addSubview(imageAndIconHStack)
    }

    public func layout() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
//        profileImageView.backgroundColor = .yellow

//        searchIcon.backgroundColor = .yellow

        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),

            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            bellIcon.widthAnchor.constraint(equalToConstant: 20),
        ])

        NSLayoutConstraint.activate([
            imageAndIconHStack.topAnchor.constraint(equalTo: topAnchor),
            imageAndIconHStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageAndIconHStack.trailingAnchor.constraint(equalTo: trailingAnchor),
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
