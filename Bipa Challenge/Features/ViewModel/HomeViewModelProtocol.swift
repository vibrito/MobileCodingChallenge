//
//  HomeViewModelProtocol.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var screenState: Observable<HomeViewState> { get set}
    func loadData()
    func reloadList()
}
