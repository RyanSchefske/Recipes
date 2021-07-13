//
//  DetailView.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/12/21.
//

import SwiftUI

struct DetailView: View {
	@Binding var showingDetailView: Bool
	
	var recipe: Recipe
	
    var body: some View {
		NavigationView {
			Text(recipe.title)
				.navigationTitle("Details")
				.navigationBarTitleDisplayMode(.inline)
				.navigationBarItems(
					trailing:
						Button {
							showingDetailView = false
						} label: {
							Image.close
						}
				)
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(showingDetailView: .constant(true), recipe: Recipe.example)
    }
}
