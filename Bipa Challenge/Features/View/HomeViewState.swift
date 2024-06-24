//
//  HomeViewState.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import Foundation

enum HomeViewState {
    case loading(isLoading: Bool)
    case showError(isShowing: Bool)
    case loadData(data: [Node])
}
