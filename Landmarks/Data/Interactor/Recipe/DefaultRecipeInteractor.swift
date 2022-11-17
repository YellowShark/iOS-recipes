//
//  DefaultRecipeInteractor.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

class DefaultRecipeInteractor : RecipeInteractor {
    private let service: RecipeService
    private let repository: RecipeRepository
    
    init(_ service: RecipeService, _ repository: RecipeRepository) {
        self.service = service
        self.repository = repository
    }
    
    func fetchRecipes(query: String, _ onSuccess: @escaping ([RecipeModel]) -> Void) async {
        let results = await service.fetchRecipes(query: query)
        DispatchQueue.main.async {
            onSuccess(results)
        }
    }
    
    func fetchDetails(model: RecipeModel) async -> RecipeModel {
        return await service.fetchDetails(id: model.id)
    }
    
    func getRecipeById(id: Int) -> RecipeModel {
        return repository.getRecipeById(id)
    }
}
