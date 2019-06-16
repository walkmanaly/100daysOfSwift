//
//  ContentView.swift
//  swiftUIButton
//
//  Created by Nick on 2019/6/16.
//  Copyright © 2019 Nick. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("border button")
                    .padding()
                    .border(Color.blue, width: 1, cornerRadius: 8)
            }
            // 分割线
            Divider()
            
            Button(action: {}) {
                Text("solid button")
                    .padding(7)
                    .foregroundColor(Color.white)
                    .background(Color.accentColor.luminanceToAlpha())
                    .cornerRadius(8)
            }
            
            Divider()
            
            Button(action: {}) {
                Text("shadow button")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(8)
                }
                .padding()
                .shadow(color: Color.gray.opacity(1), radius: 15)
            
            Divider()
            
            Button(action: {}) {
                Text("shadow button offset")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(8)
                }
                .padding()
                .shadow(radius: 15, x: 1, y: 1)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
