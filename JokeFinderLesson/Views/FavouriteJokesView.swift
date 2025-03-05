//
//  FavouriteJokesView.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-05.
//

import SwiftUI

struct FavouriteJokesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This will show saved jokes.")
            }
            .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouriteJokesView()
}
