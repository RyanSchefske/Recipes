//
//  PopularRecipeCardView.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/6/21.
//

import SwiftUI

struct PopularRecipeCardView: View {
	@ObservedObject var viewModel: PopularCardViewModel
	@State private var thumbnailImage: Image? = nil
	
	var recipe: Recipe
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 15)
				.fill(LinearGradient(gradient: Gradient(colors: [.primaryBackground, .primaryAccent]), startPoint: .leading, endPoint: .trailing))
			
			HStack {
				(thumbnailImage ?? Image.soup)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 120, height: 120)
					.clipShape(Circle())
					.shadow(color: .shadow, radius: 5, x: 0, y: 4)
				
				VStack(alignment: .leading, spacing: 3) {
					Text(recipe.title)
						.font(.title)
						.fontWeight(.semibold)
						.lineLimit(2)
						.truncationMode(.tail)
						.padding(.leading)
						.padding(.bottom, 2)
					
					if !recipe.cuisines.isEmpty {
						Text(recipe.cuisines[0])
							.font(.subheadline)
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
							.padding(.leading)
					}
					
					HStack {
						Text("250 Cal")
							.font(.subheadline)
							.fontWeight(.semibold)
						
						Spacer()
						
						LikeButton()
					}
					.padding()
				}
				.padding(.top)

				Spacer()
			}
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 8)
		.frame(height: 140)
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

struct PopularRecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
		PopularRecipeCardView(viewModel: PopularCardViewModel(), recipe: Recipe.example)
    }
}
