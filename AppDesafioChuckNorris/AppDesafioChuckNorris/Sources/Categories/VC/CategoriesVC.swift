//
//  ViewController.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import UIKit

class CategoriesVC: UIViewController {
    
    private var categoriesScreen: CategoriesScreen?
    private let viewModel: CategoriesViewModel = CategoriesViewModel()
    
    override func loadView() {
        self.categoriesScreen = CategoriesScreen()
        self.view = categoriesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        self.viewModel.fetch(.request)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}

extension CategoriesVC: CategoriesViewModelDelegate {
    func success() {
        self.categoriesScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.categoriesScreen?.tableView.reloadData()
       
    }
    
    func error(_message: String) {
        print("Error-> \(_message)")
    }
    
}

extension CategoriesVC: UITableViewDelegate {
}

extension CategoriesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identififier, for: indexPath) as? CategoriesTableViewCell
        cell?.setupCell(data: viewModel.categoryData(index: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
