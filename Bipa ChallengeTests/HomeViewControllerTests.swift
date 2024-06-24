//
//  HomeViewControllerTests.swift
//  Bipa ChallengeTests
//
//  Created by Vinicius Brito on 6/24/24.
//

import XCTest

@testable import Bipa_Challenge

final class HomeViewControllerTests: XCTestCase {
    
    var viewModel: HomeViewModelMock!
    var view: HomeViewMock!
    var sut: HomeViewController!

    override func setUp() {
        view = HomeViewMock()
        viewModel = HomeViewModelMock()
        sut = HomeViewController(contentView: view, viewModel: viewModel)
    }

    func testViewModel() throws {
        sut.viewDidLoad()

        XCTAssertTrue(viewModel.perfomeLoadDataCount == 1)
    }
}
