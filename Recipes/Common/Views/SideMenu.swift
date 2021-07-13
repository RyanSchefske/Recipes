//
//  SideMenu.swift
//  Recipes
//
//  Created by Ryan Schefske on 7/9/21.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
		NavigationView {
			ZStack {
				Color.primaryAccent
					.edgesIgnoringSafeArea(.all)
				
				Text("Hello world")
			}
			.navigationTitle("Menu")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
