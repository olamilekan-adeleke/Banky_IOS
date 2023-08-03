//
//  AccountSummaryViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    private let games = ["Pacman", "Space Invaders", "Space Patrol"]

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension AccountSummaryViewController {
    private func setUp() {
//        tableView.backgroundColor = AppColor.primaryColor
        tableView.delegate = self
        tableView.dataSource = self

//        tableView.register(AccountSummaryHeader.self, forHeaderFooterViewReuseIdentifier: "AccountSummaryHeader")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AccountSummaryCell")

        layout()
    }

    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension AccountSummaryViewController: UITableViewDelegate {}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountSummaryCell", for: indexPath)
        var config = cell.defaultContentConfiguration()

        config.text = games[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = AccountSummaryHeader()
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 144
    }
}
