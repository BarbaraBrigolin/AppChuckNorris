//
//  ViewController.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import UIKit

class CategoriesVC: UIViewController {
    
    private var screen: CategoriesScreen?
    private let viewModel: CategoriesViewModel = CategoriesViewModel()
    
    override func loadView() {
        self.screen = CategoriesScreen()
        self.view = screen
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
        self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(_message: String) {
        print("Error-> \(_message)")
    }
}

extension CategoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: JokeVC = JokeVC(categoryJoke: viewModel.categoriesData(indexPath: indexPath))
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
        print(indexPath.item)
    }
}

extension CategoriesVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identififier, for: indexPath) as? CategoriesTableViewCell
        cell?.setupCell(data: viewModel.categoriesData(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
