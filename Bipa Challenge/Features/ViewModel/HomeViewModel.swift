//
//  HomeViewModel.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import Foundation
import UIKit

class HomeViewModel {
    var screenState: Observable<HomeViewState> = Observable(.loading(isLoading: true))

    private func handleDataLoading(response: [Node]?) {
        if let data = response {
            print(data)
            self.screenState.value = .loadData(data: data)
        }
    }

    private func performLoadData() {
        screenState.value = .loading(isLoading: true)
        fetchData { response, error in
            self.screenState.value = .loading(isLoading: false)
            self.handleDataLoading(response: response)
        }
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func loadData() {
        performLoadData()
    }
    
    func reloadList() {
        performLoadData()
    }
}
