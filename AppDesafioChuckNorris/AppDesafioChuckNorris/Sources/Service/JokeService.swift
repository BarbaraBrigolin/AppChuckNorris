//
//  JokeService.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 04/01/23.
//

import UIKit
import Alamofire

protocol JokeServiceDelegate: GenericService{
    func getHome(category: String ,completion: @escaping completion<JokeData?>)
    func getHomefromJson(completion: @escaping completion<JokeData?>)
}

class JokeService: JokeServiceDelegate {
    
    func getHome(category: String ,completion: @escaping completion<JokeData?>) {
        let url: String = "https://api.chucknorris.io/jokes/random?category=\(category)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: JokeData?.self) { response in
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
    
    func getHomefromJson(completion: @escaping completion<JokeData?>) {
        if let url = Bundle.main.url(forResource: "jokeData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: JokeData? = try JSONDecoder().decode(JokeData?.self, from: data)
                completion(menu, nil)
                print("SUCCESS -> \(#function)")
            }catch {
                print("ERROR -> \(#function)")
                completion(nil, Error.fileDecodingFailed(name: "data", error))
            }
        }
    }
}
