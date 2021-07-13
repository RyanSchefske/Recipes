//
//  Errors.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/17/21.
//

import Foundation

enum APIError: Error {
	case decodingError
	case httpError(Int)
	case unknown
}
