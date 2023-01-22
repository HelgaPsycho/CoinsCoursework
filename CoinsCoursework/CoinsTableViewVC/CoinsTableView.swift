//
//  CoinsTableView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableView: UITableView {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - UITableViewDelegate

extension CoinsTableView: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSourse

extension CoinsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
