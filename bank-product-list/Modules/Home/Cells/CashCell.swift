//
//  CashCell.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class CashCell: UITableViewCell {

    static let reuseIdentifier = "CashCell"

    private let containerView: UIView = {
        let view = UIView()

        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
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

        selectionStyle = .none

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            bannerImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    func configure(with cash: CashItem) {
        if let url = URL(string: cash.bannerURL) {
            bannerImageView.loadImage(from: url)
        }
    }
}
