//
//  RealmRecipeRepository.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation
import RealmSwift

class RealmRecipeRepository : RecipeRepository {
    private let realm: Realm
    
    init(_ realm: Realm) {
        self.realm = realm
    }
    
    func saveRecipe(_ recipe: RecipeModel, onComplete: @escaping (Swift.Error?) -> Void) {
        realm.writeAsync(
            {
                self.realm.add(recipe.toEntity(), update: .modified)
            }, onComplete: { err in
                onComplete(err)
            }
        )
    }
    
    func saveRecipes(_ recipes: [RecipeModel], onComplete: @escaping (Swift.Error?) -> Void) {
        realm.writeAsync(
            {
                recipes.forEach ({ model in self.realm.add(model.toEntity(), update: .modified) })
            }, onComplete: { err in
                onComplete(err)
            }
        )
    }
    
    func getAllRecipes() -> [RecipeModel] {
        return realm.objects(RecipeEntity.self).map{$0.toModel()}
    }
    
    func getRecipesByName(_ query: String) -> [RecipeModel] {
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return getAllRecipes()
        }
        return realm.objects(RecipeEntity.self).filter{$0.title.contains(query)}.map{$0.toModel()}
    }
    
    func getRecipeById(_ id: Int) -> RecipeModel {
        return realm.object(ofType: RecipeEntity.self, forPrimaryKey: id)?.toModel() ?? RecipeModel()
    }
}
