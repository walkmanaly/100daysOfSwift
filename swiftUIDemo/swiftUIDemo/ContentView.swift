//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by Nick on 2019/6/14.
//  Copyright © 2019 Nick. All rights reserved.
//

import SwiftUI
import Combine

class Datasource: BindableObject {
    let didChange = PassthroughSubject<Void, Never>()
    var pictures = [String]()
    
    init() {
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath, let items = try? fm.contentsOfDirectory(atPath: path) {
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
        }
        
        didChange.send(())
    }
    
}

struct ContentView : View {
    @ObjectBinding var datasource = Datasource()
    
    var body: some View {
        NavigationView {
            List(datasource.pictures.identified(by: \.self)) { picture in
                Text(picture)
            }.navigationBarTitle(Text("List"))
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
