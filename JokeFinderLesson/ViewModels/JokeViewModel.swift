//
//  JokeViewModel.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-02.
//

import Foundation

@Observable
class JokeViewModel {
    
    // MARK: Stored properties
    
    // Whatever joke has most recently been downloaded from the endpoint
    var currentJoke: Joke?
    
    // MARK: Initializer(s)
    init(currentJoke: Joke? = nil) {
        
        // Take whatever joke was provided and make it the current joke
        // Otherwise, the default value for the current joke will be a nil
        self.currentJoke = currentJoke
    }
    
}
