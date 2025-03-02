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
    @State var viewModel = JokeViewModel()
    
    // Controls punchline visibility
    @State var punchlineOpacity = 0.0
    
    // Starts a timer to wait on revealing punchline
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentJoke = viewModel.currentJoke {
                
                Group {
                    Text(currentJoke.setup ?? "")
                        .padding(.bottom, 100)
                    
                    Text(currentJoke.punchline ?? "")
                        .opacity(punchlineOpacity)
                        .onReceive(timer) { _ in
                            
                            withAnimation {
                                punchlineOpacity = 1.0
                            }
                            
                            // Stop the timer
                            timer.upstream.connect().cancel()
                        }


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
