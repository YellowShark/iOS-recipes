//
//  RepositoryAssembly.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation
import Swinject
import RealmSwift

class RepositoryAssembly : Assembly {
    func assemble(container: Swinject.Container) {
        container.register(RecipeRepository.self) { _ in
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            let realm = try! Realm()
            return RealmRecipeRepository(realm)
        }.inObjectScope(.container)
    }
}

