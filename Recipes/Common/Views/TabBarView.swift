//
//  TabBarView.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/8/21.
//

import SwiftUI

struct TabBarView: View {
	@State private var selectedIndex: String = "Salad"
	
	private let titles = ["Salad", "Pasta", "Soup", "Steak"]
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack {
				ForEach(titles, id: \.self) { title in
					let isSelected = selectedIndex == title
					ZStack {
						Capsule()
							.frame(minWidth: 130)
							.frame(height: 45)
							.foregroundColor(isSelected ? .primaryGreen : .primaryAccent)
							.shadow(color: .shadow.opacity(0.3), radius: 1, x: 0, y: 3)
							.padding(.leading, 5)
						
						HStack(alignment: .center, spacing: 15) {
							Image(title)
								.resizable()
								.foregroundColor(isSelected ? .white : .primary)
								.frame(width: 30, height: 30)
							
							Text(title)
								.foregroundColor(isSelected ? .white : .primary)
								.font(.subheadline)
								.fontWeight(.semibold)
								.padding(.trailing)
						}
					}
					.onTapGesture {
						withAnimation {
							selectedIndex = title
						}
					}
					.padding(.vertical, 5)
				}
			}
		}
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
		TabBarView()
			.previewLayout(.sizeThatFits)
    }
}
