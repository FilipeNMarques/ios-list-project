//
//  UIImageView+Extensions.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

extension UIImageView {

    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "placeholder-image")
                }
            }
        }
    }
}
