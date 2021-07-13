//
//  Recipe.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/17/21.
//

import Foundation

struct Recipe: Codable, Identifiable {
	var id: Int
	var title: String
	var image: String
	var servings: Int
	var readyInMinutes: Int
	var sourceURL: String?
	var cuisines: [String]
}

extension Recipe {
	static let empty = Recipe(id: -1, title: "", image: "", servings: 0, readyInMinutes: 0, sourceURL: nil, cuisines: [])
	static let example = Recipe(id: 1, title: "Sample", image: "", servings: 3, readyInMinutes: 10, sourceURL: "", cuisines: ["American"])
	static let exampleArray = [Recipe(id: 1, title: "Sample", image: "", servings: 1, readyInMinutes: 90, sourceURL: nil, cuisines: ["Soup"]), Recipe(id: 2, title: "123", image: "", servings: 3, readyInMinutes: 10, sourceURL: "", cuisines: [])]
}
