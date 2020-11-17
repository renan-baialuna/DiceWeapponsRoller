//
//  VerticalSubview.swift
//  DiceApp
//
//  Created by Renan Baialuna on 16/11/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//
import SwiftUI

struct VerticalSubview: View {
    let nameFirst: String
    let valueFirst: String
    let nameSeccond: String
    let valueSeccond: String
    let valueSpace: CGFloat = 30
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            Spacer().frame(width: valueSpace)
            PrepertyIndicator(name: nameFirst, value: valueFirst)
            Spacer().frame(width: valueSpace)
            PrepertyIndicator(name: nameSeccond, value: valueSeccond)
            Spacer().frame(width: valueSpace)
            
        }
    }
}

struct VerticalSubview_Previews: PreviewProvider {
    static var previews: some View {
        VerticalSubview(nameFirst: "primeiro", valueFirst: "1d3", nameSeccond: "segundo", valueSeccond: "2")
    }
}
