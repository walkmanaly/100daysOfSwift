//
//  ContentView.swift
//  SimpleCaculator
//
//  Created by Nick on 2019/6/20.
//  Copyright © 2019 Nick. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding private var tipVM = TipViewModel()
    
    var body: some View {
        VStack {
            TextField($tipVM.amount, placeholder: Text("input amount:"))
                .padding()
            
            SegmentedControl(selection: $tipVM.persentage) {
                ForEach(tipVM.pers) { per in
                    Text("\(per)").tag(per)
                    }
                }.tapAction() {
                    self.tipVM.caculate()
                }
                .padding()
            
            Text(tipVM.tip == nil ? "" : "\(tipVM.tip!)")
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
