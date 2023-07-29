//
//  HomeViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 29/07/2023.
//

import Foundation
import UIKit

class HomeViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTabs()
    }

    private func setUpViews() {}

    private func setUpTabs() {}
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
