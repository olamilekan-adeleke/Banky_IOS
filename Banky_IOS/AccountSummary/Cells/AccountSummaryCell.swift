//
//  AccountSummaryCell.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 15/08/2023.
//

import SwiftUI
import UIKit

class AccountSummaryCell: UITableViewCell {
    static let cellHeight: CGFloat = 100
    static let cellReuseID: String = "AccountSummaryCell"

    let leftVStack = makeStack(axis: .vertical)
    let typeLabel = makeLabel(withText: "")
    let underlineView = makeView()
    let nameLabel = makeLabel(withText: "")

    let rightVStack = makeStack(axis: .vertical, alignment: .trailing)
    let balanceLabel = makeLabel(withText: "")
    let balanceAmountLabel = makeLabel(withText: "")

    let iconImage = makeIconImage(systemName: "chevron.right")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpStyle()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setUpStyle() {
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.text = "Account Type"
        leftVStack.addArrangedSubview(typeLabel)

        underlineView.backgroundColor = AppColor.primaryColor
        leftVStack.setCustomSpacing(8, after: typeLabel)
        leftVStack.addArrangedSubview(underlineView)

        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account Name"
        nameLabel.numberOfLines = 0
        leftVStack.setCustomSpacing(16, after: underlineView)
        leftVStack.addArrangedSubview(nameLabel)

        contentView.addSubview(leftVStack)

        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Some Balance"
        balanceLabel.textAlignment = .right
        rightVStack.addArrangedSubview(balanceLabel)

        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmountLabel.attributedText = makeFormattedAmount(amount: "929,466", cent: "45")
        balanceLabel.textAlignment = .right
        rightVStack.addArrangedSubview(balanceAmountLabel)

        contentView.addSubview(rightVStack)

        iconImage.image = iconImage.image?.withTintColor(AppColor.primaryColor, renderingMode: .alwaysOriginal)
        contentView.addSubview(iconImage)
    }

    private func layout() {
        // Left Stack
        NSLayoutConstraint.activate([
            leftVStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            leftVStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            leftVStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),

            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
        ])

        // Right Stack
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: rightVStack.trailingAnchor, multiplier: 4),
            rightVStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 40),
            rightVStack.centerYAnchor.constraint(equalToSystemSpacingBelow: leftVStack.centerYAnchor, multiplier: 0),
        ])

        // Icon Image
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: iconImage.trailingAnchor, multiplier: 2),
            iconImage.centerYAnchor.constraint(equalTo: leftVStack.centerYAnchor),
        ])
    }

    private func makeFormattedAmount(amount: String, cent: String) -> NSMutableAttributedString {
        let currencySignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption2), .baselineOffset: 8]
        let amountAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title3)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption2), .baselineOffset: 8]

        let rootString = NSMutableAttributedString(string: "\u{20A6}", attributes: currencySignAttributes)
        let amountString = NSMutableAttributedString(string: amount, attributes: amountAttributes)
        let centString = NSMutableAttributedString(string: cent, attributes: centAttributes)

        rootString.append(amountString)
        rootString.append(centString)

        return rootString
    }
}

// MARK: - UI Preview

struct AccountSummaryCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return AccountSummaryCell(style: .default, reuseIdentifier: "ID")
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct AccountSummaryCell_Review: PreviewProvider {
    static var previews: some View {
        return AccountSummaryCellRepresentable()
    }
}
