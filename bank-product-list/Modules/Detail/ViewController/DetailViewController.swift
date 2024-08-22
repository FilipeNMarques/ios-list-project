//
//  DetailViewController.swift
//  bank-product-list
//
//  Created by Filipe Marques on 21/08/24.
//

import UIKit

final class DetailViewController: UIViewController {

    private let viewModel: DetailViewModelProtocol
    private let detailView = DetailView()

    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.itemDetail.title

        detailView.configure(with: viewModel)
    }
}
