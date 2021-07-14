//
//  PopularCardViewController.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/12/21.
//

import Foundation

class PopularCardViewModel: ObservableObject {
	@Published private(set) var recipes: [Recipe] = []
	@Published private(set) var isLoading = false
	
	private var request: APIRequest<RecipeInformationResource>?
	
	func getFeaturedRecipes() {
		guard !isLoading else { return }
		isLoading = true
		
		var resource = RecipeInformationResource()
		resource.filters = ["ids": "725479,717530,773191"]
		
		let request = APIRequest(resource: resource)
		self.request = request
		request.execute { [weak self] recipes in
			self?.recipes = recipes ?? []
			self?.isLoading = false
		}
	}
	
	func downloadImage(from url: URL, completion: @escaping(Result<Data, APIError>) -> ()) {
		URLSession.shared.dataTask(with: url) { data, _, _ in
			guard let data = data else {
				completion(.failure(.unknown))
				return
			}
			
			completion(.success(data))
		}.resume()
	}
}
