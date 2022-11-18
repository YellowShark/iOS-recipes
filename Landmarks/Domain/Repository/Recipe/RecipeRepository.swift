//
//  RecipeRepository.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation

protocol RecipeRepository {
    func saveRecipe(_ recipe: RecipeModel, onComplete: @escaping (Swift.Error?) -> Void)
    func saveRecipes(_ recipes: [RecipeModel], onComplete: @escaping (Swift.Error?) -> Void)
    func getAllRecipes() -> [RecipeModel]
    func getRecipesByName(_ query: String) -> [RecipeModel]
    func getRecipeById(_ id: Int) -> RecipeModel
}
