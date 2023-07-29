//
//  UIViewController+Extension.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 29/07/2023.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = AppColor.primaryColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

    func setTabBarImage(imageName: String, title: String) {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: config)
//        image?.withTintColor(UIColor.gray)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
