//
//  RecipeInteractor.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

protocol RecipeInteractor {
    func fetchRecipes(query: String, _ onSuccess: @escaping ([RecipeModel]) -> Void) async
    
    func fetchDetails(model: RecipeModel) async -> RecipeModel
    
    func getRecipeById(id: Int) -> RecipeModel
}
