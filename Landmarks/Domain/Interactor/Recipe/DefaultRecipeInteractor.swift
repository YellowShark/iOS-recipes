//
//  DefaultRecipeInteractor.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

class DefaultRecipeInteractor : RecipeInteractor {
    private let service: RecipeService
    
    init(_ service: RecipeService) {
        self.service = service
    }
    
    func fetchRecipes(query: String) async -> [RecipeModel] {
        return await service.fetchRecipes(query: query)
    }
    
    func fetchDetails(model: RecipeModel) async -> RecipeModel {
        return await service.fetchDetails(id: model.id)
    }
}
