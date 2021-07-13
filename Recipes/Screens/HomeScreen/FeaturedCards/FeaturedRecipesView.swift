//
//  FeaturedCardView.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/17/21.
//

import SwiftUI

struct FeaturedRecipesView: View {
	@StateObject var viewModel = FeaturedCardViewModel()
	@State private var showingDetailView = false
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack {
				if viewModel.isLoading {
					ForEach(0..<4) { _ in
						FeaturedRecipeCardView(viewModel: viewModel, recipe: Recipe.empty)
							.redacted(reason: .placeholder)
							.padding(.horizontal, 5)
					}
				} else {
					ForEach(viewModel.recipes) { recipe in
						FeaturedRecipeCardView(viewModel: viewModel, recipe: recipe)
							.padding(.horizontal, 5)
							.onTapGesture {
								showingDetailView = true
							}
							.sheet(isPresented: $showingDetailView) {
								DetailView(showingDetailView: $showingDetailView, recipe: recipe)
							}
					}
				}
			}
			.padding(.horizontal, 10)
		}
		.frame(height: 400)
		.onAppear {
			if viewModel.recipes.isEmpty {
				viewModel.getFeaturedRecipes()
			}
		}
	}
}

struct FeaturedRecipesView_Previews: PreviewProvider {
	static var previews: some View {
		FeaturedRecipesView()
	}
}
