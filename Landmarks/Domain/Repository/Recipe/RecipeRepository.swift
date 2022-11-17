//
//  RecipeRepository.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation

protocol RecipeRepository {
    func saveRecipe(_ recipe: RecipeModel)
    func saveRecipes(_ recipes: [RecipeModel])
    func getAllRecipes() -> [RecipeModel]
    func getRecipeById(_ id: Int) -> RecipeModel
}
