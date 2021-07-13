//
//  NetworkManager.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/21/21.
//

import SwiftUI

protocol APIResource {
	associatedtype ModelType: Decodable
	var methodPath: String { get }
	var filters: [String: String]? { get }
}
 
extension APIResource {
	var url: URL {
		var components = URLComponents()
		components.host = "api.spoonacular.com"
		components.path = methodPath
		components.scheme = "https"
		
		components.queryItems = []
		components.queryItems?.append(URLQueryItem(name: "apiKey", value: "d12ba4264fd440e6a95a53be77e6d937"))
		
		if let filters = filters {
			for (key, value) in filters {
				components.queryItems?.append(URLQueryItem(name: key, value: value))
			}
		}
		
		return components.url!
	}
}

protocol NetworkRequest: AnyObject {
	associatedtype ModelType
	func decode(_ data: Data) -> ModelType?
	func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
	fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
		let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _ , _) -> Void in
			guard let data = data,
				  let value = self?.decode(data)
			else {
				DispatchQueue.main.async { completion(nil) }
				return
			}
			DispatchQueue.main.async { completion(value) }
		}
		task.resume()
	}
}

class APIRequest<Resource: APIResource> {
	let resource: Resource
	
	init(resource: Resource) {
		self.resource = resource
	}
}
 
extension APIRequest: NetworkRequest {
	func decode(_ data: Data) -> Resource.ModelType? {
		let decoder = JSONDecoder()
		let wrapper = try? decoder.decode(Resource.ModelType.self, from: data)
		return wrapper
	}
	
	func execute(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
		load(resource.url, withCompletion: completion)
	}
}
 
struct Wrapper<T: Decodable>: Decodable {
	let recipes: [T]
}
