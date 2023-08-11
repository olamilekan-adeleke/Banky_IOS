//
//  Component.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 11/08/2023.
//

import UIKit

func makeLabel(
    withText text: String,
    ofSize: CGFloat = 16,
    weight: UIFont.Weight = .medium,
    isDebug: Bool = false
) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.backgroundColor = isDebug ? .yellow : .clear
    label.font = UIFont.systemFont(ofSize: ofSize, weight: weight)
    return label
}

func makeImage(named: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: named)
    imageView.contentMode = .scaleAspectFit
    return imageView
}

func makeStack(axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = axis
    stack.distribution = .fill
    stack.alignment = .fill
    return stack
}

func iconImageView(systemName: String) -> UIView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: systemName)
    imageView.contentMode = .scaleAspectFit
    return imageView
}
