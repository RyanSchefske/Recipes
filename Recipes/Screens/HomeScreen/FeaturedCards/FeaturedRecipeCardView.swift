//
//  FeaturedRecipeCardView.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/17/21.
//

import SwiftUI

struct FeaturedRecipeCardView: View {
	@ObservedObject var viewModel: FeaturedCardViewModel
	@State private var thumbnailImage: Image? = nil
	
	var recipe: Recipe
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.primaryAccent)
				.frame(width: 300, height: 400)
			
			VStack(alignment: .leading) {
				Spacer()
				
				HStack {
					Spacer()
					
					(thumbnailImage ?? Image.soup)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 185, height: 185)
						.clipShape(Circle())
						.shadow(color: .shadow, radius: 15, x: 0, y: 10)
						.padding()
					
					Spacer()
				}
				
				Spacer()
				
				Text(recipe.title)
					.font(.title)
					.fontWeight(.semibold)
					.frame(minWidth: 150, idealWidth: 240, maxWidth: 390, alignment: .leading)
					.truncationMode(.tail)
					.minimumScaleFactor(0.5)
					.padding(.leading)
				
				HStack {
					VStack(alignment: .leading) {
						Text("Soup")
							.font(.subheadline)
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
						
						Text("250 Cal")
							.fontWeight(.semibold)
					}
					.padding(.leading)
					
					Spacer()
					
					LikeButton()
						.padding()
				}
				.padding(.bottom, 5)
			}
		}
		.padding(.horizontal, 7)
		.frame(width: 300, height: 400)
		.onAppear {
			guard
				recipe.image != "",
				let url = URL(string: recipe.image),
				thumbnailImage == nil
			else { return }
			
			viewModel.downloadImage(from: url) { result in
				if case .success(let data) = result {
					guard let image = UIImage(data: data) else { return }
					self.thumbnailImage = Image(uiImage: image)
				}
			}
		}
	}
}

struct FeaturedRecipeCardView_Previews: PreviewProvider {
	static var previews: some View {
		FeaturedRecipeCardView(viewModel: FeaturedCardViewModel(), recipe: Recipe.example)
	}
}
