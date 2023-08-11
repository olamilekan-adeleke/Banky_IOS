//
//  AccountSummaryHeader.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 03/08/2023.
//

import SwiftUI
import UIKit


class AccountSummaryHeader: UIView {
    static let height: CGFloat = 100

    let imageAndIconHStack = UIStackView()
    let profileImageView = UIImageView()
//    let searchIcon = iconImageView(systemName: "magnifyingglass")
    let searchIcon = iconImageView(systemName: "bell.fill")
    let bellIcon = iconImageView(systemName: "bell.fill")

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.bounds.width, height: 144)
    }
}

extension AccountSummaryHeader {
    public func style() {
        backgroundColor = UIColor.gray.withAlphaComponent(0.1)

        imageAndIconHStack.translatesAutoresizingMaskIntoConstraints = false
        imageAndIconHStack.axis = .horizontal
        imageAndIconHStack.distribution = .equalSpacing

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "person")
        profileImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true

//        profileImageView.layer.cornerRadius = frame.width / 2
//        profileImageView.clipsToBounds = true
//        profileImageView.backgroundColor = .systemTeal

        searchIcon.translatesAutoresizingMaskIntoConstraints = false
//        searchIcon.frame.size.height = 32
//        searchIcon.frame.size.width = 32
//        searchIcon.contentMode = .scaleToFill

        bellIcon.translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
     
    }
}

// Component
extension AccountSummaryHeader {
    private static func iconImageView(systemName: String) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: systemName)?.withRenderingMode(.alwaysTemplate)
        view.addSubview(imageView)
        return view
    }
}


struct AccountSummaryHeaderRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return AccountSummaryHeader()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct AccountSummaryHeader_Preview: PreviewProvider {
    static var previews: some View {
        return AccountSummaryHeaderRepresentable()
    }
}
