//
//  CoinsTableController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableController: UIViewController {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    
    var coinsArray: [CoinModel] = []  {
        didSet {
            
            DispatchQueue.main.async { [weak self] in
                
                if self?.coinsArray.count != 0 {
                    self?.hideActivityIndicator()
                    self?.message.isHidden = true
                }
                
                self?.tableView.reloadData()
                
            }
            
            DispatchQueue.main.asyncAfter(deadline:  .now() + 2) {
                if self.coinsArray.count == 0 {
                    self.hideActivityIndicator()
                    self.message.isHidden = false
                }
            }
            
        }
    }
    
    
    private var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "rectangle.portrait.and.arrow.forward")
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appIndigo])
        let confNormalImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        let confHighlImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        button.setImage(confNormalImage, for: .normal)
        button.setImage(confHighlImage, for: .highlighted)
        
        return button
    }()
    
    
    
    private var sortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Sort  ", for: .normal)
        button.setTitleColor(UIColor.appIndigo, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        let image = UIImage(systemName: "chevron.down")
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appIndigo])
        let confImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        button.setImage(confImage, for: .normal)
        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var tableView = CoinsTableView(frame: .zero, style: .plain)
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .appIndigo
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden =  false
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    var message: UILabel = {
        let label = UILabel()
        label.text = """
        Server is not available now.
        Please try later.
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = font
        label.textColor = .appBeige
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appLightBeige
        setupController()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("=========VIEW WILL APPEAR CALLED========")
        getCoinsArray()
    }
    override func viewWillDisappear(_ animated: Bool) {
        message.isHidden = true
    }
    
    func setupController() {
        setupHierarhy()
        setupConstraints()
        configureTableView()
        exitButton.addTarget(self, action: #selector(changeRootController), for: .touchUpInside)
        listenVM()
        
        
    }
    
    
    
    func setupHierarhy() {
        view.addSubview(navigationController!.navigationBar)
        view.addSubview(topView)
        topView.addSubview(exitButton)
        topView.addSubview(sortButton)
        view.addSubview(tableView)
        tableView.addSubview(activityIndicator)
        tableView.addSubview(message)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!),
            topView.heightAnchor.constraint(equalToConstant: 44),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
    
    
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
    }
    
    func hideActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    
    @objc func sortButtonPressed(sender: UIButton){
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
    
    func listenVM() {
        guard var VM = viewModel else {
            return
        }
        VM.coinsArrayClosure =  {[weak self] array in
            self?.coinsArray = array
            
            
            
        }
        
    }
    
    
    @objc func changeRootController() {
        guard let VM = viewModel else {return}
        VM.changeRootController()
    }
    
    
}

//MARK: - UITableViewDelegate

extension CoinsTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        
        //        coinsArray = []
        //
        //        guard let VM = self.viewModel else {return false}
        //        VM.getCoinsArray()
        
        return false
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
