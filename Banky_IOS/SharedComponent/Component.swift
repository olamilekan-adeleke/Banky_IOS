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

extension UIImageView {
    func roundCornersForAspectFit(radius: CGFloat) {
        if let image = self.image {
            // calculate drawingRect
            let boundsScale = self.bounds.size.width / self.bounds.size.height
            let imageScale = image.size.width / image.size.height

            var drawingRect: CGRect = self.bounds

            if boundsScale > imageScale {
                drawingRect.size.width = drawingRect.size.height * imageScale
                drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
            } else {
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
