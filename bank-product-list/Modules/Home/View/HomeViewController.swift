//
//  HomeViewController.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelProtocol

    private var homeView = HomeView()


    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.fetchStoreData()
    }

    private func setupTableView() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }

    private func bindViewModel() {
        viewModel.didUpdateData = { [weak self] in
            DispatchQueue.main.async {
                self?.homeView.tableView.reloadData()
            }
        }

        viewModel.didFailWithError = { error in
            DispatchQueue.main.async {
                GlobalAlert.showDefault(
                    on: self,
                    title: "Erro ao carregar os dados",
                    message: "Tente novamente mais tarde.",
                    actionTitle: "Beleza"
                )
            }
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SpotlightCell.reuseIdentifier, for: indexPath) as? SpotlightCell else { return UITableViewCell() }

            let item = viewModel.spotlightItems[indexPath.row]
            cell.configure(with: item)

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }

            let product = viewModel.products[indexPath.row]
            cell.configure(with: product)

            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CashCell.reuseIdentifier, for: indexPath) as? CashCell else { return UITableViewCell() }

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
