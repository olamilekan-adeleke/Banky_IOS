//
//  Labels.swift
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
