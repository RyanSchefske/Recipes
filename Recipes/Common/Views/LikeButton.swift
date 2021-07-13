//
//  LikeButton.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/8/21.
//

import SwiftUI

struct LikeButton: View {
	
	@State private var liked: Bool = false
	
    var body: some View {
		Button(action: {
			liked.toggle()
		}) {
			(liked ? Image.likeFilled : Image.like)
				.foregroundColor(liked ? .red : .primary)
		}
		.background(
			Circle()
				.fill(Color.primaryBackground)
				.frame(width: 40, height: 40)
		)
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
    }
}
