//
//  RecipeService.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

protocol RecipeService {
    func fetchRecipes(query: String) async -> [RecipeModel]
    
    func fetchDetails(id: Int) async -> RecipeModel
}
