//
//  HomeView.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

class HomeView: UIView {

    // MARK: - UI Elements
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SpotlightCell.self, forCellReuseIdentifier: SpotlightCell.reuseIdentifier)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseIdentifier)
        tableView.register(CashCell.self, forCellReuseIdentifier: CashCell.reuseIdentifier)
        return tableView
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
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
