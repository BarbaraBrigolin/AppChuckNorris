//
//  JokeVC.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 05/01/23.
//

import UIKit

class JokeVC: UIViewController {
    
    private var jokeScreen: JokeScreen?
    private let viewModel: JokeViewModel = JokeViewModel()
    
    override func loadView() {
        self.jokeScreen = JokeScreen()
        self.view = JokeScreen()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fech(.request)

    }


}
