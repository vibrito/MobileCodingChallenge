//
//  HomeViewProtocol.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import UIKit

protocol HomeViewProtocol where Self: UIView {
    var pullToRefreshTrigged: (() -> Void)? { get set }
    func showLoading(isLoading: Bool)
    func loadData(nodes: [Node])
}
