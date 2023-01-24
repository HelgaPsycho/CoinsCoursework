//
//  CoinsTableController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableController: UIViewController {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    private var tableView = CoinsTableView(frame: .zero, style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setupController()
        
        
    }
    
    func setupController() {
        setupHierarhy()
        setupConstraints()
        configureTableView()
    }
    
    func setupHierarhy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.rowHeight = 200
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
    }
}
    
//MARK: - UITableViewDelegate

extension CoinsTableController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSourse

extension CoinsTableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoinModel.coinsStringsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoinCell else {fatalError()}
        cell.label.text = CoinModel.coinsStringsArray[indexPath.row]
        print("cell with \(CoinModel.coinsStringsArray[indexPath.row]) init")
        return cell
    }
    
    
}
