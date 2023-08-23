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

    private var accountList: [Account] = []
    var profile: Profile?
//    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
//    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []

    let tableView = UITableView()
    let header = AccountSummaryHeader()
    let refeashControl = UIRefreshControl()

    var isLoading: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        populateWithSkeletonCell()
        fetchData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension AccountSummaryViewController {
    private func setUp() {
        tableView.sectionHeaderTopPadding = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.cellReuseID)
        tableView.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.cellHeight
        tableView.tableFooterView = UIView()

        header.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = header
        tableView.tableHeaderView?.layoutIfNeeded()

        refeashControl.tintColor = AppColor.primaryColor
        refeashControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refeashControl

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
        let account = accountCellViewModels[indexPath.row]

        if isLoading {
            let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseID, for: indexPath) as! SkeletonCell
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.cellReuseID, for: indexPath) as! AccountSummaryCell
        cell.configure(with: account)
        return cell
    }
}

extension AccountSummaryViewController {
    private func populateWithSkeletonCell() {
        let cell = Account(id: "", type: .Banking, name: "", amount: 0, createdDateTime: Date())
        accountList = Array(repeating: cell, count: 10)
        configureTableViewCell(with: accountList)
    }

    private func fetchData() {
        let group = DispatchGroup()

        group.enter()
        fetchAccount(forUserID: "1") { result in
            switch result {
                case .success(let accountsList):
                    self.accountList = accountsList
                case .failure(let error):
                    print(error.localizedDescription)
            }
            group.leave()
        }

        group.notify(queue: .main) {
            self.refeashControl.endRefreshing()

            self.configureTableViewCell(with: self.accountList)
            self.isLoading = false
            self.tableView.reloadData()
        }
    }

    private func configureTableViewCell(with accounts: [Account]) {
        accountCellViewModels = accounts.map { account in
            AccountSummaryCell.ViewModel(accountType: account.type, accountName: account.name, balance: account.amount)
        }
    }

    @objc private func refreshContent() {
        // reset data
        profile = nil
        accountList = []
        isLoading = true
        tableView.reloadData()
        fetchData()
    }
}
