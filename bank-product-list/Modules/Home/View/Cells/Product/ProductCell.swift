//
//  ProductCell.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class ProductCell: UITableViewCell {

    static let reuseIdentifier = "ProductTableViewCell"

        private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 16
            layout.minimumInteritemSpacing = 0

            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .clear
            collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)

            return collectionView
        }()

        var products: [ProductItem] = [] {
            didSet {
                collectionView.reloadData()
            }
        }

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            contentView.addSubview(collectionView)

            collectionView.delegate = self
            collectionView.dataSource = self

            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            ])
        }
}

extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as?  ProductCollectionViewCell else { return UICollectionViewCell() }

        let product = products[indexPath.item]

        cell.configure(with: product)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
