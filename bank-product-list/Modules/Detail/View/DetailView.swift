//
//  DetailView.swift
//  bank-product-list
//
//  Created by Filipe Marques on 22/08/24.
//

import UIKit

final class DetailView: UIView {
    
    // MARK: - UI Elements
    let imageView: UIImageView = {
        let imageView = UIImageView()

        imageView.contentMode = .scaleAspectFit
        imageView.accessibilityIdentifier = "DetailViewImageView"
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.accessibilityIdentifier = "DetailViewDescriptionLabel"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 150),

            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 26),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    func configure(with viewModel: DetailViewModelProtocol) {
        descriptionLabel.text = viewModel.itemDetail.description

        if let url = URL(string: viewModel.itemDetail.imageURL) {
            imageView.loadImage(from: url)
        }
    }
}

