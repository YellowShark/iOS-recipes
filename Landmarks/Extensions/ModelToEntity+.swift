//
//  ModelToEntity+.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import Foundation
import RealmSwift

extension RecipeModel {
    func toEntity() -> RecipeEntity {
        return RecipeEntity(id: self.id, title: self.name, image: self.urlRef, sourceUrl: self.sourceUrl, summary: self.info)
    }
}
