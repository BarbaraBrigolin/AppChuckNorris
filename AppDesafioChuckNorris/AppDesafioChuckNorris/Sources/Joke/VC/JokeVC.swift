//
//  JokeVC.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 05/01/23.
//

import UIKit

class JokeVC: UIViewController {
    
    private var jokeScreen: JokeScreen?
    private let viewModel: JokeViewModel 
    

    
    override func loadView() {
        self.jokeScreen = JokeScreen()
        self.view = JokeScreen()
    }
    
    required init(category: JokeData) {
        viewModel = JokeViewModel(category: category)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewModel.fech(.request)

    }


}
