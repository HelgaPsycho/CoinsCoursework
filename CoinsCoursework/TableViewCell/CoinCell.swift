//
//  CoinCell.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import UIKit

class CoinCell: UITableViewCell {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    
    var coinName: String? {
        didSet {
            if coinName != nil {
                viewModel?.getCoin(named: coinName!)}
            else {return}
        }
    }

    func listenViewModel() {
        guard var VM = self.viewModel else{
            return
        }
        VM.coinModel = {[weak self] model in
            self?.coinModel = model
        }
    }
    
    var coinModel: CoinModel? {
        didSet {
            
            guard let model = coinModel else {return}
            
            iconView.image = UIImage(named: model.symbol)
            titleLabel.text = model.name
            priceLabel.text = String(model.priceUsd)
            dayChangesLabel.text = String(model.percentChangeUsdLast24Hours)
            hourChangesLabel.text = String(model.percentChangeUsdLast1Hour)
            dayChangesImage.image = UIImage(systemName: "arrow.up.right.square")?.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [UIColor.white]))
            hourChangesImage.image = UIImage(systemName: "arrow.down.right.square")?.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [UIColor.white]))
 //arrow.right.square
        
        }
    }
    
    private var centerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.appIndigo
        return view
    }()

    
    private var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private var centralStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = font
        label.textColor = .white
        return label
    
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = font
        label.textColor = .white
        return label
    
    }()
    
    
    private var rightStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    private var hourChangesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = font
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private var dayChangesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = font
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private var imageRightStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    private var hourChangesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var dayChangesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.appLightBeige
        setHierarhy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHierarhy(){
        self.addSubview(centerView)
        self.addSubview(iconView)
        self.addSubview(centralStack)
        centralStack.addArrangedSubview(titleLabel)
        centralStack.addArrangedSubview(priceLabel)
        self.addSubview(rightStack)
        rightStack.addArrangedSubview(hourChangesLabel)
        rightStack.addArrangedSubview(dayChangesLabel)
        self.addSubview(imageRightStack)
        imageRightStack.addArrangedSubview(hourChangesImage)
        imageRightStack.addArrangedSubview(dayChangesImage)

    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            centerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            centerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            centerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            centerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            iconView.leftAnchor.constraint(equalTo: centerView.leftAnchor, constant: 10),
            iconView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor),
            iconView.heightAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 2/3),
            iconView.widthAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 2/3),
            
            centralStack.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 20),
            centralStack.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20),
            centralStack.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -20),
            centralStack.widthAnchor.constraint(equalTo: centerView.widthAnchor, multiplier: 1/3),
            
            rightStack.rightAnchor.constraint(equalTo: imageRightStack.leftAnchor, constant: -20),
            rightStack.leftAnchor.constraint(equalTo: centralStack.rightAnchor, constant: 20),
            rightStack.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20),
            rightStack.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -20),
            
            imageRightStack.rightAnchor.constraint(equalTo: centerView.rightAnchor, constant: -20),
            imageRightStack.widthAnchor.constraint(equalToConstant: 40),
            imageRightStack.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20),
            imageRightStack.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -20)
            
          
        ])
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}


