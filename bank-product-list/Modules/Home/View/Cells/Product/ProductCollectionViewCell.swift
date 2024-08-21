//
//  ProductCollectionViewCell.swift
//  bank-product-list
//
//  Created by Filipe Marques on 21/08/24.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "ProductCollectionViewCell"

    private let containerView: UIView = {
        let view = UIView()

        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let productImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
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
        contentView.addSubview(containerView)

        containerView.addSubview(productImageView)
        containerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            productImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor)
        ])
    }

    func configure(with product: ProductItem) {
        titleLabel.text = product.name

        if let url = URL(string: product.imageURL) {
            productImageView.loadImage(from: url)
        }
    }
}

