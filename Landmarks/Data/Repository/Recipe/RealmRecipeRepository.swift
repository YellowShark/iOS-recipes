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
    
    func saveRecipe(_ recipe: RecipeModel) {
        do {
            try realm.write {
                realm.add(recipe.toEntity())
            }
        } catch {
            print(error)
        }
    }
    
    func saveRecipes(_ recipes: [RecipeModel]) {
        do {
            try realm.write {
                recipes.forEach { model in realm.add(model.toEntity()) }
            }
        } catch {
            print(error)
        }
    }
    
    func getAllRecipes() -> [RecipeModel] {
        return realm.objects(RecipeEntity.self).map{$0.toModel()}
    }
    
    func getRecipeById(_ id: Int) -> RecipeModel {
        return realm.object(ofType: RecipeEntity.self, forPrimaryKey: id)?.toModel() ?? RecipeModel()
    }
}
