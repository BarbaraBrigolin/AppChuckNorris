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
    
    private var jokeData: JokeData?
    private var category: String?
    
    public func fech(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.request:
            self.service.getHome(category: category ?? "") { sucess, error in
                if let sucess = sucess {
                    self.jokeData = sucess
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

