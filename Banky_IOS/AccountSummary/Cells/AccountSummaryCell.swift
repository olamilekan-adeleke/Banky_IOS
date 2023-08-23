//
//  AccountSummaryCell.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 15/08/2023.
//

import SwiftUI
import UIKit

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
}

class AccountSummaryCell: UITableViewCell {
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal

        var balanaceAsAtribbutedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }

    let viewModel: ViewModel? = nil
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
    public func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanaceAsAtribbutedString

        switch vm.accountType {
            case .Banking:
                underlineView.backgroundColor = AppColor.primaryColor
                balanceLabel.text = "Current Balance"
            case .CreditCard:
                underlineView.backgroundColor = .systemOrange
                balanceLabel.text = "Current Balance"
            case .Investment:
                underlineView.backgroundColor = .systemPurple
                balanceLabel.text = "Value"
        }
    }

    private func setUpStyle() {
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.text = ""
        leftVStack.addArrangedSubview(typeLabel)

        underlineView.backgroundColor = AppColor.primaryColor
        leftVStack.setCustomSpacing(8, after: typeLabel)
        leftVStack.addArrangedSubview(underlineView)

        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = ""
        nameLabel.numberOfLines = 0
        leftVStack.setCustomSpacing(16, after: underlineView)
        leftVStack.addArrangedSubview(nameLabel)

        contentView.addSubview(leftVStack)

        balanceLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        balanceLabel.text = ""
        balanceLabel.textAlignment = .right
        rightVStack.addArrangedSubview(balanceLabel)

        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
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

//    private func makeFormattedAmount(amount: String, cent: String) -> NSMutableAttributedString {
//        let currencySignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption2), .baselineOffset: 8]
//        let amountAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title3)]
//        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption2), .baselineOffset: 8]
//
//        let rootString = NSMutableAttributedString(string: "\u{20A6}", attributes: currencySignAttributes)
//        let amountString = NSMutableAttributedString(string: amount, attributes: amountAttributes)
//        let centString = NSMutableAttributedString(string: cent, attributes: centAttributes)
//
//        rootString.append(amountString)
//        rootString.append(centString)
//
//        return rootString
//    }
}

// MARK: - UI Preview

struct AccountSummaryCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let cellView = AccountSummaryCell(style: .default, reuseIdentifier: "ID")
        cellView.configure(with: AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Sapa Savings", balance: 989719.09))
        return cellView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct AccountSummaryCell_Review: PreviewProvider {
    static var previews: some View {
        return AccountSummaryCellRepresentable()
    }
}
