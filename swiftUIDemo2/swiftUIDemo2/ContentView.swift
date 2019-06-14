//
//  ContentView.swift
//  swiftUIDemo2
//
//  Created by Nick on 2019/6/14.
//  Copyright © 2019 Nick. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var anwser = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var alertMessage = ""
    @State private var showAleart = false
    
    var body: some View {
        NavigationView {
            VStack {
                    ForEach(0...2) { country in
                        Image(self.countries[country])
                            .border(Color.black, width: 1)
                            .tapAction {
                                self.flagTap(country)
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle(Text(countries[anwser].uppercased()))
                .presentation($showAleart) {
                    Alert(title: Text("Oops"), message: Text(alertMessage), dismissButton: .default(Text("continue")) {
                        self.askQuestion()
                        })
            }
        }
    }
    
    func flagTap(_ tag: Int) {
        if tag == anwser {
            score += 1
            alertMessage = "you are right, score\(score)"
        } else {
            score -= 1
            alertMessage = "you are wrong, score\(score)"
        }
        showAleart = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        anwser = Int.random(in: 0...2)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
