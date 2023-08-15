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

    let leftVStack = makeStack(axis: .vertical, debug: true)
    let typeLabel = makeLabel(withText: "")
    let underlineView = makeView()
    let nameLabel = makeLabel(withText: "")

    let rightVStack = makeStack(axis: .vertical, alignment: .trailing, debug: true)
    let balanceLabel = makeLabel(withText: "")
    let balanceAmountLabel = makeLabel(withText: "")

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
        leftVStack.setCustomSpacing(16, after: underlineView)
        leftVStack.addArrangedSubview(nameLabel)

        contentView.addSubview(leftVStack)

        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Some Balance"
        balanceLabel.textAlignment = .right
        rightVStack.addArrangedSubview(balanceLabel)

        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmountLabel.text = "$929,466,63"
        balanceLabel.textAlignment = .right
        rightVStack.addArrangedSubview(balanceAmountLabel)

        contentView.addSubview(rightVStack)
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
            rightVStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rightVStack.trailingAnchor, multiplier: 4),
            rightVStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 60),
            rightVStack.centerYAnchor.constraint(equalToSystemSpacingBelow: leftVStack.centerYAnchor, multiplier: 0),
        ])
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
