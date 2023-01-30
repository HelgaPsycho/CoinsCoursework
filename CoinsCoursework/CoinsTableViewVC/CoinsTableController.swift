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
            
            guard coinsArray.isEmpty == false else{
                return
            }
            
            let indexPath: IndexPath = IndexPath(row: ((self.coinsArray.count - 1)), section: 0)
            DispatchQueue.main.sync {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
                
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
        return button
    }()
    
    private var tableView = CoinsTableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appLightBeige
        setupController()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print ("=========VIEW WILL APPEAR CALLED========")
        getCoinsArray()
    }
    

    func setupController() {
        setupHierarhy()
        setupConstraints()
        configureTableView()
        exitButton.addTarget(self, action: #selector(changeRootController), for: .touchUpInside)
        listenVM()
        //getCoinsArray()

    }
    

    
    func setupHierarhy() {
        view.addSubview(navigationController!.navigationBar)
        view.addSubview(topView)
        topView.addSubview(exitButton)
        topView.addSubview(sortButton)
        view.addSubview(tableView)
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
            sortButton.centerXAnchor.constraint(equalTo: topView.centerXAnchor)

            
        ])
        
    }
  
    
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
    }
    
    func getCoinsArray() {
        guard  let VM = viewModel else {return}
        VM.getCoinsArray()
    }
    
//MARK: - ViewModel
    
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
    
//    func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
//
//        coinsArray = []
//
//        guard let VM = self.viewModel else {return false}
//        VM.getCoinsArray()
//
//        return true
//    }
}
//MARK: - UITableViewDataSourse

extension CoinsTableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let VM = viewModel else {return 0}
        return VM.coinsStringsArray.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoinCell else {fatalError()}
        
        if coinsArray.isEmpty == false {
            cell.coinModel = coinsArray[indexPath.row]
        }
        
        
        return cell
    }
    
    
}
