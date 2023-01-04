//
//  CategoriesTableViewCellScreen.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 04/01/23.
//

import UIKit

class CategoriesTableViewCellScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Teste"
        return label
    }()
    
    lazy var vetorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = ">"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        self.addSubview(titleLabel)
        self.addSubview(vetorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            vetorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            vetorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
