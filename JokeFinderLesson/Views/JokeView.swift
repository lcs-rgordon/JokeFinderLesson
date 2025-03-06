//
//  JokeView.swift
//  JokeFinderLesson
//
//  Created by Russell Gordon on 2025-03-02.
//

import SwiftUI

// NOTE: Excellent summary of how timers work at:
//       https://sarunw.com/posts/timer-in-swiftui/

struct JokeView: View {
    
    // MARK: Stored properties
    
    // Access the view model from the environment
    @Environment(JokeViewModel.self) var viewModel
    
    // Controls punchline visibility
    @State var punchlineOpacity = 0.0

    // Starts a timer to wait on revealing punchline
    @State var punchlineTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    // Set the hue for the background color
    @State var hue = 60.0/360.0 // Yellow
    
    // Controls amount of offset when dragging
    @State var dragOffset = CGSize.zero

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Background
                Color(hue: (60.0 + dragOffset.width / 4) / 360.0, saturation: 0.8, brightness: 0.9)
                    .ignoresSafeArea()


                // Foreground
                VStack {
                    
                    // Show a joke if one exists
                    if let currentJoke = viewModel.currentJoke {
                        
                        Group {
                            Text(currentJoke.setup ?? "")
                                .padding(.bottom, 100)
                            
                            Text(currentJoke.punchline ?? "")
                                .opacity(punchlineOpacity)
                                .onReceive(punchlineTimer) { _ in
                                    
                                    withAnimation {
                                        punchlineOpacity = 1.0
                                    }
                                    
                                    // Stop the timer
                                    punchlineTimer.upstream.connect().cancel()
                                }
                            
                        }
                        .padding()
                        .font(.title)
                        .multilineTextAlignment(.center)
                        // Ensure that we can drag even when tapping on space between the Text views
                        .contentShape(Rectangle())
                        // Rotate the card at 1/5 the distance it has been dragged
                        .rotationEffect(.degrees(Double(dragOffset.width / 20)))
                        // Move the view a bit ahead of the finger's position
                        .offset(x: dragOffset.width)
                        // Set opacity based on amount of drag
                        .opacity(2 - Double(abs(dragOffset.width / 75)))
                        // Enable dragging of this view
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    dragOffset = gesture.translation
                                }
                                .onEnded { gesture in
                                    
                                    // Remove the joke if the user dragged far enough to the left or right
                                    if abs(dragOffset.width) > 100 {
                                        
                                        // Swipe right, save the joke
                                        if dragOffset.width > 0 {
                                            viewModel.saveJoke()
                                        }
                                        
                                        // Clear the old joke
                                        viewModel.clearJoke()
                                        
                                        // Now get a new joke
                                        Task {
                                            await viewModel.fetchJoke()
                                            print(viewModel.favouriteJokes.count)
                                        }
                                        
                                        // Move the view back to it's original position
                                        dragOffset = .zero
                                        
                                        // Make the punchline invisible again
                                        punchlineOpacity = 0
                                        
                                    } else {
                                        
                                        // Move the view back to it's original position
                                        dragOffset = .zero
                                        
                                    }
                                }
                        )

                    } else {

                        Spacer()
                        
                        // Show a spinner to indicate that data is being loaded
                        ProgressView()
                        
                        Spacer()
                        
                    }
                    
                }
                .navigationTitle("New Jokes")

            }
        }
    }
}

#Preview {
    JokeView()
        .environment(JokeViewModel())
}
