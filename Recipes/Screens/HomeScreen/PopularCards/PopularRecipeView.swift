//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/24/21.
//

import SwiftUI

struct PopularRecipeView: View {
	@StateObject var viewModel = PopularCardViewModel()
	@State private var showingDetailView = false
	
    var body: some View {
		VStack(alignment: .leading) {
			LazyHStack {
				Text("Popular")
					.font(.title)
					.fontWeight(.semibold)
					.padding(.leading, 20)
				
				Spacer()
			}
			
			if viewModel.isLoading {
				ForEach(0..<3) { _ in
					PopularRecipeCardView(viewModel: viewModel, recipe: Recipe.empty)
						.redacted(reason: .placeholder)
				}
			} else {
				ForEach(viewModel.recipes) { recipe in
					PopularRecipeCardView(viewModel: viewModel, recipe: recipe)
						.onTapGesture {
							showingDetailView = true
						}
						.sheet(isPresented: $showingDetailView) {
							DetailView(showingDetailView: $showingDetailView, recipe: recipe)
						}
				}
			}
		}
		.frame(height: 500)
		.onAppear {
			if viewModel.recipes.isEmpty {
				viewModel.getFeaturedRecipes()
			}
		}
    }
}

struct PopularRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRecipeView()
    }
}
