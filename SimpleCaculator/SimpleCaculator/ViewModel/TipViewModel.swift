//
//  TipViewModel.swift
//  SimpleCaculator
//
//  Created by Nick on 2019/6/20.
//  Copyright © 2019 Nick. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class TipViewModel: BindableObject {
    
    var amount: String = ""
    var persentage: Int = 0
    var tip: Double?
    var pers = [10,15,20,25]
    
    let didChange = PassthroughSubject<TipViewModel, Never>()
    
    func caculate() {
        
        guard let amount = Double(amount) else {
            return
        }
        
        self.tip = amount * (Double(persentage) / 100)
        didChange.send(self)
    }
    
}
