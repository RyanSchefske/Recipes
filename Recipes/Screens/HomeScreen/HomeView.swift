//
//  ContentView.swift
//  Recipes
//
//  Created by Ryan Schefske on 6/14/21.
//

import SwiftUI

struct HomeView: View {
	
	@State private var menuOpen = false
	@State var searchText: String = ""
	
	init() {
		UINavigationBar.appearance().backgroundColor = UIColor(Color.primaryBackground)
		UINavigationBar.appearance().tintColor = UIColor(.primary)
	}
	
	var body: some View {
		NavigationView {
			ZStack {
				Color.primaryBackground
					.edgesIgnoringSafeArea(.all)
				
				ScrollView(showsIndicators: false) {
					HStack {
						Text("Your week at a glance.")
							.foregroundColor(.secondary)
							.padding(.leading, 20)
						
						Spacer()
					}
					
					TabBarView()
					
					FeaturedRecipesView()
						.padding(.top, 5)
					
					PopularRecipeView()
				}
				.navigationBarTitle("Home")
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						Button(action: {
							menuOpen = true
						}) {
							Image.menu
						}
					}
					
					ToolbarItem(placement: .navigationBarTrailing) {
						NavigationLink(destination: SearchView()) {
							Image.search
						}
					}
				}
				.popover(isPresented: $menuOpen, content: {
					SideMenu()
				})
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
