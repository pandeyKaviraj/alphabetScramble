//
//  ContentView.swift
//  alphabetScramble
//
//  Created by KAVIRAJ PANDEY on 26/10/20.
//  Copyright © 2020 KAVIRAJ PANDEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                VStack {
                    TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    
                    List(usedWords, id: \.self) {
                        Image(systemName: "\($0.count).circle")
                        Text($0)
                    }
                }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
        }
        }
    }
    
    func addNewWord() {
        //lowercase and trim the word, to make sure we dont add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
        //extra validation to come
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    // App initial data to start the game
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        
        // If were are *here* then there was a probleam - trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    // Typed word validation section
    
    
    
    
    
}// end of content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
