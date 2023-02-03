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
    private var categoriesList: [String] = []
    
    private weak var delegate: CategoriesViewModelDelegate?
    public func delegate(delegate: CategoriesViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { sucess, error in
                if let sucess = sucess {
                    self.categoriesList = sucess
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case.request:
            self.service.getHome { success, error in
                if let success = success {
                    self.categoriesList = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return categoriesList.count
    }
    
    public func categoriesData(indexPath: IndexPath) -> String {
        return categoriesList[indexPath.row]
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
