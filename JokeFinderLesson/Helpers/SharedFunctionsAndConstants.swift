//
//  SharedFunctionsAndConstants.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-05.
//

import Foundation

// Return the directory that we can save user data in
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// Identify the file that data will be saved to in Documents directory
let fileLabel = "FavouriteJokes"
