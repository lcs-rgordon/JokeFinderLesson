//
//  JokeView.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-02.
//

import SwiftUI

struct JokeView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default joke)
    @State var viewModel = JokeViewModel(currentJoke: exampleJoke)
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentJoke = viewModel.currentJoke {
                
                Group {
                    Text(currentJoke.setup ?? "")
                        .padding(.bottom, 100)
                    
                    Text(currentJoke.punchline ?? "")

                }
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
                
            } else {

                Spacer()
                
                // Show a spinner to indicate that data is being loaded
                ProgressView()
                
                Spacer()
                
            }
            
        }
    }
}

#Preview {
    JokeView()
}
