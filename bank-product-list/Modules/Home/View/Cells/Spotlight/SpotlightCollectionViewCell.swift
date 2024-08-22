//
//  SpotlightCollectionViewCell.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class SpotlightCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "SpotlightCollectionViewCell"

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(bannerImageView)

        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func configure(with item: SpotlightItem) {
        if let url = URL(string: item.bannerURL) {
            bannerImageView.loadImage(from: url)
        }
    }
}
