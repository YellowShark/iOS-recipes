//
//  EntityToModel+.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation

extension RecipeEntity {
    func toModel() -> RecipeModel {
        return RecipeModel(id: self.id, name: self.title, info: self.summary, urlRef: self.image, sourceUrl: self.sourceUrl)
    }
}
