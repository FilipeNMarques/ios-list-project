//
//  SpotlightCell.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class SpotlightCell: UITableViewCell {

    static let reuseIdentifier = "SpotlightCell"

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

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(bannerImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            bannerImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 150),

            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with item: SpotlightItem) {
        titleLabel.text = item.name
        descriptionLabel.text = item.description

        if let url = URL(string: item.bannerURL) {
            bannerImageView.loadImage(from: url)
        }
    }
}
