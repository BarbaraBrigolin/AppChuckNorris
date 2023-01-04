//
//  CategoriesTableViewCell.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 04/01/23.
//

import UIKit

enum CategoriesTableViewCellString: String {
    case identifier = "CategoriesTableViewCell"
}

class CategoriesTableViewCell: UITableViewCell {
    static let identififier: String = CategoriesTableViewCellString.identifier.rawValue
    
    lazy var screen = {
        let view = CategoriesTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
        addSubView()
        setUpConstraints()
    }
    
    private func addSubView(){
        self.contentView.addSubview(self.screen)
    }
    
    public func setupCell(data: CategoryData) {
        self.screen.titleLabel.text = data.title 
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
