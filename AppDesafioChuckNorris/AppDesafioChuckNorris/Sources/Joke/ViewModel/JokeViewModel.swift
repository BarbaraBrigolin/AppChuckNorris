//
//  JokeViewModel.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 05/01/23.
//

import UIKit

protocol JokeViewModelDelegate: AnyObject {
    func success()
    func error(_message: String)
}

class JokeViewModel  {
    
    private let service: JokeService = JokeService()
    private weak var delegate: JokeViewModelDelegate?

    public func delegate(delegate: JokeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    private var categoryJoke: JokeData
    
    init(categoryJoke: JokeData) {
        self.categoryJoke = categoryJoke
    }


    private var categories: String?
    
    
    public func fech(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.request:
            self.service.getHome(category: categories ?? "") { sucess, error in
                if let sucess = sucess {
                    self.categoryJoke = sucess
                    self.delegate?.success()
                } else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case .mock:
            print("testar depois")
        }
    }
}

