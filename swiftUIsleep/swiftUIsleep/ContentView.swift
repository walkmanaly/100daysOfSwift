//
//  ContentView.swift
//  swiftUIsleep
//
//  Created by Nick on 2019/6/16.
//  Copyright © 2019 Nick. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var date = Date()
    @State private var dateInterval = 0.0
    @State private var cup = 1
    
    var body: some View {
        VStack {
            Text("When will you sleep?")
                .font(.headline)
                .lineLimit(nil)
            
            DatePicker($date, displayedComponents:.hourAndMinute)
            
            Text("time interval")
                .font(.headline)
                .lineLimit(nil)
            
            Stepper(value: $dateInterval, in: 0...8, step: 0.25) {
                Text("\(dateInterval, specifier: "%g") hours")
            }
            
            Text("coffe")
                .font(.headline)
                .lineLimit(nil)
            
            Stepper(value: $cup, in: 0...15, step: 1) {
                Text("\(cup) cup")
            }
            Spacer()
        }
            .navigationBarTitle(Text("Bed Time"))
            .navigationBarItems(trailing:
                Button(action: {}) {
                    Text("caculate")
                }
            )
            .padding()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
