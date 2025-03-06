//
//  FavouriteJokesView.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-05.
//

import SwiftUI

struct FavouriteJokesView: View {

    // MARK: Stored properties
    
    // Access the view model from the environment
    @Environment(JokeViewModel.self) var viewModel

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            ZStack {
                Color.forFavouriteJokes
                    .ignoresSafeArea()
                
                if viewModel.favouriteJokes.isEmpty {
                    ContentUnavailableView("No favourite jokes", systemImage: "heart.slash", description: Text("See if a new joke might tickle your funny bone!"))
                } else {
                    List(viewModel.favouriteJokes) { currentJoke in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(currentJoke.setup ?? "")
                            Text(currentJoke.punchline ?? "")
                                .italic()
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouriteJokesView()
        .environment(JokeViewModel())
}
