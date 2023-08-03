//
//  HomeViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 29/07/2023.
//

import Foundation
import UIKit

class HomeViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTabs()
    }

    private func setUpViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()

        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.barTintColor = AppColor.primaryColor
        hideNavigationBarLine(summaryNC.navigationBar)

        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }

    private func setUpTabs() {
        tabBar.tintColor = AppColor.primaryColor
        tabBar.isTranslucent = false
    }

    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let image = UIImage()
        navigationBar.shadowImage = image
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.isTranslucent = false
        navigationBar.isHidden = true
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
