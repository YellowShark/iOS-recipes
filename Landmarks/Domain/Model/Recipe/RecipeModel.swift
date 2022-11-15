//
//  RecipeModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import Foundation

struct RecipeModel: Identifiable {
    let id: Int
    let name: String
    let info: String
    let urlRef: String
    let isFavorite: Bool = false
    
    init(id: Int = 0, name: String, info: String, urlRef: String) {
        self.id = id
        self.name = name
        self.info = info
        self.urlRef = urlRef
    }
}
