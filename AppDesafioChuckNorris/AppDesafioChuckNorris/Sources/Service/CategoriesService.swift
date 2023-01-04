//
//  CategoriesService.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import Foundation
import Alamofire

protocol CategoriesServiceDelegate: GenericService{
    func getHome(completion: @escaping completion<[String]?>)
    func getHomefromJson(completion: @escaping completion<[String]?>)
}

class CategoriesService: CategoriesServiceDelegate {
    
    
    func getHome(completion: @escaping completion<[String]?>) {
        let url: String = "https://api.chucknorris.io/jokes/categories"
        
        AF.request(url, method: .get).validate().responseDecodable(of: [String]?.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getHomefromJson(completion: @escaping completion<[String]?>) {
        if let url = Bundle.main.url(forResource: "categoriesData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: [String]? = try JSONDecoder().decode([String]?.self, from: data)
                completion(menu, nil)
                print("SUCCESS -> \(#function)")
            }catch {
                print("ERROR -> \(#function)")
                completion(nil, Error.fileDecodingFailed(name: "data", error))
            }
        }
    }
    

}
