//
//  HomeView.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//
 
import UIKit

class HomeView: UIView {
    var safeArea: UILayoutGuide!
    var nodes = [Node]()
    
    var pullToRefreshTrigged: (() -> Void)?
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    private let pullToRefreshView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var refreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        return refreshControl
    }()
    
    init() {
        super.init(frame: .zero)
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .darkGray
        tableView.register(HomeCell.self, forCellReuseIdentifier: "identifier")
        buildView()
        setupContraints()
        buildPullToRefresh()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
    }
    
    @objc private func pullToRefreshAction() {
        pullToRefreshTrigged?()
        refreshControl.endRefreshing()
    }
}

extension HomeView: HomeViewProtocol {
    func loadData(nodes: [Node]) {
        self.nodes = nodes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoading(isLoading: Bool) {
        print("isLoading - - > \(isLoading)")
    }
}

extension HomeView {
    func buildView() {
        safeArea = self.layoutMarginsGuide
        addSubview(tableView)
    }
    
    func setupContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! HomeCell
        let data = nodes[indexPath.row]
        cell.labelPublicKey.text = "Public Key: \(data.publicKey ?? "")"
        cell.labelAlias.text = "Alias: \(data.alias ?? "")"
        cell.labelChannels.text = "Exchang: \(data.channels ?? 0)"
        cell.labelCapacity.text = "Capacity: \(data.capacity ?? 0)"
        cell.labelFirstSeen.text = "First seen: \(cell.convertTime(unixTime: data.firstSeen))"
        cell.labelUpdatedAt.text = "Update at: \(cell.convertTime(unixTime: data.updatedAt))"
        cell.labelCity.text = "City: \(data.city?.ptBR ?? "")"
        cell.labelContry.text = "Country: \(data.country?.ptBR ?? "")"
        return cell
    }
}

