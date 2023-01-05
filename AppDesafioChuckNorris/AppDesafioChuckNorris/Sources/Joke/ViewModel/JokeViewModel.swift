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
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.request:
            self.service.getHome(category: <#T##String#>, completion: <#T##JokeService.completion<JokeData?>##JokeService.completion<JokeData?>##(_ result: JokeData?, _ failure: Error?) -> Void#>)
        case .mock:
            <#code#>
        }
        
    }

}
