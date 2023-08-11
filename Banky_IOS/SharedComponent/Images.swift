//
//  Images.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 11/08/2023.
//

import UIKit

func makeImage(named: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: named)
    imageView.contentMode = .scaleAspectFit
    return imageView
}
