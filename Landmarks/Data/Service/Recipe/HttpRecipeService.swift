//
//  HttpRecipeService.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

class HttpRecipeService : RecipeService {
    struct Common {
        static let apiKey = "d8984725e8224950a239ba8a2e1ecf47";
        static let baseUrl = "https://api.spoonacular.com";
        static let recipesInteractor = "recipes";
    }
    
    struct Methods {
        static let search = "complexSearch";
    }
    
    struct Params {
        static let apiKey = "apiKey"
        static let query = "query"
    }
    
    func fetchRecipes(query: String) async -> [RecipeModel] {
        let url = buildUrlRequest(params: [
            Params.query: query
        ])
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let result = try JSONDecoder().decode(RecipesDto.self, from: data)
            print("Result:", result)
            return result.results.map { $0.toModel() };
        } catch {
            print("Cannot decode.")
            print(error)
            return [];
        }
    }
    
    private func buildUrlRequest(
        baseUrl: String = Common.baseUrl,
        interactor: String = Common.recipesInteractor,
        method: String = Methods.search,
        params: [String: String]
    ) -> URL {
        var paramsString = ""
        for (key, value) in params {
            if (!value.isEmpty) {
                paramsString += "&\(key)=\(value)"
            }
        }
        guard let url = URL(string: "\(baseUrl)/\(interactor)/\(method)?\(Params.apiKey)=\(Common.apiKey)\(paramsString)") else {
            fatalError("Missing URL")
            
        }
        print("Fetch: ", url)
        return url
    }
}
