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
        setupNavigationBar()
        viewModel.fetchStoreData()
    }

    private func setupNavigationBar() {
        title = "Digio Store"
        navigationController?.navigationBar.prefersLargeTitles = true
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
            return 1
        case 1:
            return 1
        case 2:
            return viewModel.cash != nil ? 1 : 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SpotlightTableViewCell.reuseIdentifier, for: indexPath) as? SpotlightTableViewCell else { return UITableViewCell() }

            cell.spotlightItems = viewModel.spotlightItems

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }

            cell.products = viewModel.products

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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()

        headerView.accessibilityIdentifier = "header-section"

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        tableView.separatorStyle = .none
        titleLabel.textColor = .black
        tableView.backgroundColor = .white

        switch section {
        case 1:
            titleLabel.text = "Produtos"
        case 2:
            titleLabel.text = "Cash"
        default:
            return nil
        }

        headerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 220
        default:
            return UITableView.automaticDimension
        }
    }
}
