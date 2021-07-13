//
//  RecipeInformationResource.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/24/21.
//

import Foundation

struct RecipeInformationResource: APIResource {
	typealias ModelType = [Recipe]
	
	var methodPath: String {
		return "/recipes/informationBulk"
	}
	
	var filters: [String: String]?
}
