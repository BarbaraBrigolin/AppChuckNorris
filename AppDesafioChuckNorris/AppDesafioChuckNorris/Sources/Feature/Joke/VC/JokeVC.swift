//
//  JokeVC.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 05/01/23.
//

import UIKit

class JokeVC: UIViewController {
    
    private var jokeScreen: JokeScreen = JokeScreen()
    private let viewModel: JokeViewModel
    

    override func loadView() {
        self.jokeScreen = JokeScreen()
        self.view = jokeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate(delegate: self)
        self.viewModel.fech(.request)

    }
    
    required init(categoryJoke: String) {
        viewModel = JokeViewModel(categoryJoke: categoryJoke)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension JokeVC: JokeViewModelDelegate {
    
    func success() {
        self.jokeScreen.jokeLabel.text = viewModel.jokeResult
    }
    
    func error(_message: String) {
        print("--> ERROR <--")
    }
    
    
}
