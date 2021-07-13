//
//  SearchVIew.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/9/21.
//

import SwiftUI

struct SearchView: View {
	
	@State private var searchText = ""
	var searchResults = ["Soup", "Chicken", "Pasta"]
	
    var body: some View {
		VStack {
			SearchBar(text: $searchText)
				.padding(.top, 10)
			
			List {
				ForEach(searchResults, id: \.self) { result in
					Text(result)
				}
			}
			.listStyle(PlainListStyle())
		}
		.navigationTitle("Search")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchVIew_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			SearchView()
				.navigationTitle("Menu")
				.navigationBarTitleDisplayMode(.inline)
		}
    }
}
