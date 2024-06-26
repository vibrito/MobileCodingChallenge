//
//  HomeViewModelMock.swift
//  Bipa ChallengeTests
//
//  Created by Vinicius Brito on 6/24/24.
//

import UIKit

@testable import Bipa_Challenge

final class HomeViewModelMock {
    var screenState: Observable<HomeViewState> = Observable(.loading(isLoading: true))
    
    private(set) var perfomeLoadDataCount = 0
    private(set) var perfomeReoadDataCount = 0
}

extension HomeViewModelMock: HomeViewModelProtocol {
    func reloadList() {
        perfomeReoadDataCount += 1
    }
    
    func loadData() {
        perfomeLoadDataCount += 1
    }
}
