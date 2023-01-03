//
//  CategoriesData.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 03/01/23.
//

import Foundation
// MARK: - CategoriesData
struct CategoriesData: Codable {
    var result: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var categories: [String]?
    var createdAt: String?
    var iconURL: String?
    var id, updatedAt: String?
    var url: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
