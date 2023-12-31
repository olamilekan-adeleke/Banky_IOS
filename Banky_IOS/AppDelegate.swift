//
//  AppDelegate.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 23/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let homeView = HomeViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboardingViewController.delegate = self

        setUpLogOutListener()
        handleRootView()

        return true
    }
}

extension AppDelegate: LoginViewControllerDelegete, LogOutDelegate {
    func didLogin() {
        setRootViewController(homeView)
    }

    func didLogOut() {
        setRootViewController(loginViewController)
    }

    @objc private func handleRootView() {
        if UserLocalState.hasOnboarded {
            window?.rootViewController = loginViewController
        } else {
            window?.rootViewController = onboardingViewController
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didOnboard() {
        UserLocalState.hasOnboarded = true
        setRootViewController(loginViewController)
    }
}

// Actions
extension AppDelegate {
    private func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }

    private func setUpLogOutListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleRootView), name: .logOut, object: nil)
    }
}
