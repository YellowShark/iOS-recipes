//
//  RecipeEntity.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 17.11.2022.
//

import RealmSwift

class RecipeEntity: Object {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var title: String = ""
    @Persisted var image: String = ""
    @Persisted var sourceUrl: String = ""
    @Persisted var summary: String = ""
    
    convenience init(id: Int, title: String, image: String, sourceUrl: String, summary: String) {
        self.init()
        self.id = id
        self.title = title
        self.image = image
        self.sourceUrl = sourceUrl
        self.summary = summary
    }
}
