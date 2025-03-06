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
            VStack {
                Text("There are \(viewModel.favouriteJokes.count) saved jokes.")
            }
            .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouriteJokesView()
        .environment(JokeViewModel())
}
