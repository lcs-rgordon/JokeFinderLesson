//
//  Joke.swift
//  JokeFinder
//
//  Created by Russell Gordon on 2025-03-01.
//

import Foundation

struct Joke: Identifiable, Codable {
    
    // MARK: Stored properties
    let type: String
    let setup: String?
    let punchline: String?
    let id: Int
    
    // MARK: Computed properties
    
    // Return setup and punchline (for sharing via text message)
    var setupAndPunchline: String {
        
        if let setup = self.setup, let punchline = self.punchline {
            return "\(setup)\n\n\(punchline)"
        } else {
            return ""
        }
        
    }
        
}

// Create an example joke for testing purposes
let exampleJoke = Joke(
    type: "general",
    setup: "Why couldn't the kid go to see the pirate movie?",
    punchline: "Because it was rated arrrrr!",
    id: 310
)
