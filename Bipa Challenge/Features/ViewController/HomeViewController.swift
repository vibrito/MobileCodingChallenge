//
//  HomeViewController.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let contentView: HomeViewProtocol
    private let viewModel: HomeViewModelProtocol
    
    init(contentView: HomeViewProtocol = HomeView(), viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindProperties()
        bindActions()
        viewModel.loadData()
    }
    
    private func bindProperties() {
        viewModel.screenState.bind { [weak self] state in
            switch state {
            case .loading(isLoading: let isLoading):
                self?.contentView.showLoading(isLoading: isLoading)
            case .showError(isShowing: let isShowing):
                self?.contentView.showLoading(isLoading: !isShowing)
            case .loadData(data: let data):
                self?.contentView.loadData(nodes: data)
            }
        }
    }
    
    private func bindActions() {
        contentView.pullToRefreshTrigged = { [weak self] in
            self?.viewModel.reloadList()
        }
    }
}
