//
//  JokeFinderLessonApp.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-02.
//

import SwiftUI

@main
struct JokeFinderLessonApp: App {
    
    // MARK: Stored properties

    // Create the view model
    @State var viewModel = JokeViewModel()
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            JokeView()
                .environment(viewModel)
        }
    }
}
