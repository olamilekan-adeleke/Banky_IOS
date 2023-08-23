//
//  AccountSummaryViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    private var accountCellViewModels: [AccountSummaryCell.ViewModel] = []
    let tableView = UITableView()
    let header = AccountSummaryHeader()

    private var accountList: [Account] = []
    var profile: Profile?
//    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
//    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []

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
        return accountCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard accountCellViewModels.isEmpty == false else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.cellReuseID, for: indexPath) as! AccountSummaryCell
        let account = accountCellViewModels[indexPath.row]
        cell.configure(with: account)

        return cell
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        fetchAccount(forUserID: "1") { result in
            switch result {
                case .success(let accountsList):
                    self.accountList = accountsList
                    self.configureTableViewCell(with: accountsList)
                    self.tableView.reloadData()

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    private func configureTableViewCell(with accounts: [Account]) {
        accountCellViewModels = accounts.map { account in
            AccountSummaryCell.ViewModel(accountType: account.type, accountName: account.name, balance: account.amount)
        }
    }
}
