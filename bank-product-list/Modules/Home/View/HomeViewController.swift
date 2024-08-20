//
//  HomeViewController.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelProtocol

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SpotlightCell.self, forCellReuseIdentifier: SpotlightCell.reuseIdentifier)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseIdentifier)
        tableView.register(CashCell.self, forCellReuseIdentifier: CashCell.reuseIdentifier)
        return tableView
    }()

    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchStoreData()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel.didUpdateData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.didFailWithError = { error in
            //TODO: Handle error, maybe show an alert to the user
            print("Failed to fetch data: \(error.localizedDescription)")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.spotlightItems.count
        case 1:
            return viewModel.products.count
        case 2:
            return viewModel.cash != nil ? 1 : 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SpotlightCell.reuseIdentifier, for: indexPath) as! SpotlightCell
            let item = viewModel.spotlightItems[indexPath.row]
            cell.configure(with: item)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
            let product = viewModel.products[indexPath.row]
            cell.configure(with: product)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CashCell.reuseIdentifier, for: indexPath) as! CashCell
            if let cash = viewModel.cash {
                cell.configure(with: cash)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
