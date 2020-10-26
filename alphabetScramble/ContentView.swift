//
//  ContentView.swift
//  alphabetScramble
//
//  Created by KAVIRAJ PANDEY on 26/10/20.
//  Copyright © 2020 KAVIRAJ PANDEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let people = ["Ganga", "Muku", "Sonu", "Bhopal", "Ganesh"]
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // Loaded the file into a string
            }
            
        }
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
