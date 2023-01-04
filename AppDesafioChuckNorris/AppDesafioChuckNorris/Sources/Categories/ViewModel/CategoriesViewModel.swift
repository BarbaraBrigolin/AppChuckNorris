//
//  CategoriesViewModel.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import UIKit

enum TypeFetch {
    case request
    case mock
}

protocol CategoriesViewModelDelegate: AnyObject {
    func success()
    func error(_message: String)
}

class CategoriesViewModel {
    
    private let service: CategoriesService = CategoriesService()
    private weak var delegate: CategoriesViewModelDelegate?

    public func delegate(delegate: CategoriesViewModelDelegate?) {
        self.delegate = delegate
    }
    
    private var categoriesData: [String]?
    
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { sucess, error in
                if let sucess = sucess {
                    self.categoriesData = sucess
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case.request:
            self.service.getHome { success, error in
                if let success = success {
                    self.categoriesData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
}

