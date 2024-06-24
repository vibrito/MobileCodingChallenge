//
//  HomeViewMock.swift
//  Bipa ChallengeTests
//
//  Created by Vinicius Brito on 6/24/24.
//

import UIKit

@testable import Bipa_Challenge

final class HomeViewMock: UIView {
    private(set) var perfomLoadDataCount = 0
    private(set) var perfomShowLoading = 0
}

extension HomeViewMock: HomeViewProtocol {
    func showLoading(isLoading: Bool) {
        perfomShowLoading += 1
    }
    
    func loadData(nodes: [Node]) {
        perfomLoadDataCount += 1
    }
}
