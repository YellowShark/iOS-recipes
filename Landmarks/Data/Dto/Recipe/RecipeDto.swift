//
//  RecipeDto.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

struct RecipesDto : Codable {
    let results: [RecipeDto]
}

struct RecipeDto : Codable {
    let id: Int
    let title: String
    let image: String
}
