//
//  ViewController.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import UIKit

class CategoriesVC: UIViewController {
    
    private var viewModel: CategoriesViewModel = CategoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.viewModel.fetch(.mock)
    }


}

