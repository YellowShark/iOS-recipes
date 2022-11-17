//
//  RecipeModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import Foundation

struct RecipeModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let info: String
    let urlRef: String
    let isFavorite: Bool = false
    let sourceUrl: String
    
    init() {
        self.id = 0
        self.name = ""
        self.info = ""
        self.urlRef = ""
        self.sourceUrl = ""
    }
    
    init(id: Int = 0, name: String, info: String, urlRef: String, sourceUrl: String = "") {
        self.id = id
        self.name = name
        self.info = info
        self.urlRef = urlRef
        self.sourceUrl = sourceUrl
    }
}
