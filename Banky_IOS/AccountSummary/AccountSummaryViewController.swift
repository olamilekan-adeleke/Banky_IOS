//
//  AccountSummaryViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    private var accounts: [AccountSummaryCell.ViewModel] = []
    let tableView = UITableView()
    let header = AccountSummaryHeader()

    var profile: Profile?
    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setUp()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.cellReuseID)
    }
}

extension AccountSummaryViewController {
    private func setUp() {
        tableView.sectionHeaderTopPadding = 0
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AccountSummaryCell")
        tableView.rowHeight = AccountSummaryCell.cellHeight
        tableView.tableFooterView = UIView()

        header.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = header
        tableView.tableHeaderView?.layoutIfNeeded()
        // tableView.tableHeaderView = tableView.tableHeaderView

        layout()
    }

    private func layout() {
        view.addSubview(tableView)

        // Header
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: tableView.topAnchor),
            header.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            header.widthAnchor.constraint(equalTo: tableView.widthAnchor),
        ])
    }
}

extension AccountSummaryViewController: UITableViewDelegate {}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard accounts.isEmpty == false else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.cellReuseID, for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)

        return cell
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings", balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "No-Fee All-In Chequing", balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa Avion Card", balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Student Mastercard", balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver", balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Growth Fund", balance: 15000.00)

        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}
