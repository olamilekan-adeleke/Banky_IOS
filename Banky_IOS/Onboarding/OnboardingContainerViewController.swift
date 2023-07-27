//
//  OnboardingContainerViewController.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 26/07/2023.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    let pageViewController: UIPageViewController
    var pages: [UIViewController]
    var currentVC: UIViewController
    let closeButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(
            image: "E-Wallet-pana",
            title: "Get started with banky",
            subtitle: "A simple and secure app to help you track your spending, save money, and reach your financial goals"
        )
        let page2 = OnboardingViewController(
            image: "Finance-bro",
            title: "Manage your money with ease",
            subtitle: "Get insights into your spending habits so you can make informed financial decisions"
        )
        let page3 = OnboardingViewController(
            image: "Revenue-cuate",
            title: "Take control of your financial future",
            subtitle: "Set and track financial goals to stay on track"
        )
        
        pages = [page1, page2, page3]
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        style()
        layout()
    }
    
    private func setUp() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
        
        // Others
        view.addSubview(closeButton)
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        // PageView
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.systemTeal.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = UIColor.systemTeal
        
        // CloseButton
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        closeButton.tintColor = .systemTeal
    }
    
    private func layout() {
        // View
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        // CloseButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
        ])
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: currentVC) ?? 0
    }
}

// MARK: - Actions

extension OnboardingContainerViewController {
    @objc private func closeButtonTapped(_ sender: UIButton) {}
}
