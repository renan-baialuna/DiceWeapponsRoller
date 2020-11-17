//
//  PrepertyIndicator.swift
//  DiceApp
//
//  Created by Renan Baialuna on 16/11/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import SwiftUI

struct PrepertyIndicator: View {
    let name: String
    let value: String
    var body: some View {
        HStack(alignment: .bottom) {
            Text(name + ":")
                .font(.custom(fontsEnum.bold.rawValue, size: 15))
            ZStack{
//                Rectangle()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.red)
                Text(" \(value) ")
                .font(.custom(fontsEnum.bold.rawValue, size: 30))
                
                .border(Color(UIColor(named: ColorsEnum.third.rawValue)!), width: 3)
                .background(Color(UIColor(named: ColorsEnum.background.rawValue)!))
                
            }
        }
    }
}

struct PrepertyIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PrepertyIndicator(name: "nome", value: "2")
    }
}
