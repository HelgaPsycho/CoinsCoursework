//
//  CoinsTableController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableController: UIViewController {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
   
    var coinsStringArray: [String]?
    
    private var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return view
    }()
    
    private var tableView = CoinsTableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appLightBeige
        setupController()
        
        
    }
    
    func setupController() {
        navigationController?.isNavigationBarHidden = true
        setupHierarhy()
        setupConstraints()
        configureTableView()
        viewModel?.getCoinsArray()
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
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
    }
    
//MARK: - ViewModel
    
    func listenVM() {
        guard var VM = viewModel else {
            return
        }
        VM.setCoinsArray = {[weak self] array in
            self?.setCoinsArray(array: array)
            
        }
    
    }
    
    func setCoinsArray(array: [String]){
        print("setCoinsArrayCalled")
        coinsStringArray = array
        print(coinsStringArray)
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
        guard let array = coinsStringArray else { return cell}
        cell.viewModel = viewModel
        cell.coinName = array[indexPath.row]
      //  print("cell with \(coinsStringArray[indexPath.row]) init")
        return cell
    }
    
    
}
