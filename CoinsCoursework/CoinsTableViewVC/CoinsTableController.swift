//
//  CoinsTableController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableController: UIViewController {
    
    public var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    
    private var coinsArray: [CoinModel] = []  {
        didSet {
            
            DispatchQueue.main.async { [weak self] in
                
                if self?.coinsArray.count != 0 {
                    self?.hideActivityIndicator()
                    self?.message.isHidden = true
                }
                
                self?.tableView.reloadData()
                
            }
            
            DispatchQueue.main.asyncAfter(deadline:  .now() + 4) {
                if self.coinsArray.count == 0 {
                    self.hideActivityIndicator()
                    self.message.isHidden = false
                }
            }
            
        }
    }
    
    
    private lazy var topView: UIView = makeTopView()
    private lazy var exitButton: UIButton = makeExitButton()
    private lazy var sortButton: UIButton = makeSortButton()
    private var tableView = CoinsTableView(frame: .zero, style: .plain)
    private lazy var activityIndicator: UIActivityIndicatorView = makeActivityIndicator()
    private lazy var message: UILabel = makeMessageLabel()
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appLightBeige
        setupController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoinsArray()
        mainNavigationController.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        message.isHidden = true
    }
    
    private func setupController() {
        mainNavigationController.isNavigationBarHidden = true
        setupHierarhy()
        setupConstraints()
        configureTableView()
        sortButton.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(changeRootController), for: .touchUpInside)
        listenVM()
        
    }
    
    private func setupHierarhy() {
        view.addSubview(topView)
        topView.addSubview(exitButton)
        topView.addSubview(sortButton)
        view.addSubview(tableView)
        tableView.addSubview(activityIndicator)
        tableView.addSubview(message)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 44),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            exitButton.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -20),
            exitButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            exitButton.heightAnchor.constraint(equalTo: topView.heightAnchor),
            exitButton.widthAnchor.constraint(equalTo: topView.heightAnchor),
            
            sortButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            sortButton.heightAnchor.constraint(equalToConstant: 40),
            sortButton.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100),
            
            message.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            message.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: -30),
            message.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: 30)
            
            
        ])
        
    }
        
    private func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(getCoinArrayWithRefreshControl), for: .valueChanged)
    }
    
    private func hideActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func showActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    
    @objc private func sortButtonPressed(sender: UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Sort by decrease price per hour", style: .default, handler: {(UIAlertAction) in self.viewModel?.sortBy(.decreasePricePerHour)}))
        alert.addAction(UIAlertAction(title: "Sort by ascending price per hour", style: .default, handler: {(UIAlertAction) in self.viewModel?.sortBy(.ascendingPricePerHour)}))
        alert.addAction(UIAlertAction(title: "Sort by decrease price per day", style: .default, handler: {(UIAlertAction) in self.viewModel?.sortBy(.decreasePricePerDay)}))
        alert.addAction(UIAlertAction(title: "Sort by ascending price per day", style: .default, handler: { (UIAlertAction) in self.viewModel?.sortBy(.ascendingPrisePerDay)}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - ViewModel
    
    func getCoinsArray() {
        showActivityIndicator()
        guard  let VM = viewModel else {return}
        VM.getCoinsArray()
    }
    
    @objc private func getCoinArrayWithRefreshControl() {
        showActivityIndicator()
        message.isHidden = true
        guard  let VM = viewModel else {return}
        VM.getCoinsArray()
        
    }
    
    func listenVM() {
        coinsArray = []
        guard var VM = viewModel else {
            return
        }
        VM.coinsArrayClosure =  {[weak self] array in
            self?.coinsArray = array
            
                DispatchQueue.main.async {
                    self?.refreshControl.endRefreshing()
                
            }
     
        }
    }
    
    @objc private func changeRootController() {
        guard let VM = viewModel else {return}
        VM.changeRootController()
    }
    
    
}

//MARK: - UITableViewDelegate

extension CoinsTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = DetailsVCBuilder().build() as! DetailsViewController
        if var VM = detailsVC.viewModel {
            VM.coinModel = coinsArray[indexPath.row]}
        mainNavigationController.pushViewController(detailsVC, animated: true)
    }
}
//MARK: - UITableViewDataSourse

extension CoinsTableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return coinsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoinCell else {fatalError()}

        
        cell.coinModel = coinsArray[indexPath.row]
        
        return cell
    }
    
    
}
