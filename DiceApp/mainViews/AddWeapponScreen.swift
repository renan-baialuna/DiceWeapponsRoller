//
//  addWeapponScreen.swift
//  DiceApp
//
//  Created by Renan Baialuna on 17/11/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import SwiftUI

struct AddWeapponScreen: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: ColorsEnum.main.rawValue)!]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: ColorsEnum.main.rawValue)!]
        
        UINavigationBar.appearance().backgroundColor = UIColor(named: ColorsEnum.background.rawValue)!
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: fontsEnum.black.rawValue, size: 35)!]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: fontsEnum.black.rawValue, size: 30)!]

        UINavigationBar.appearance().tintColor = UIColor(named: ColorsEnum.third.rawValue)!
    }
    @State private var name: String = "0"
    var colorWhite = Color(UIColor(named: ColorsEnum.main.rawValue)!)
    var colorGreen = Color(UIColor(named: ColorsEnum.third.rawValue)!)
    var colorBlue = Color(UIColor(named: ColorsEnum.seccond.rawValue)!)
    var colorDarkBlue = Color(UIColor(named: ColorsEnum.background.rawValue)!)
    
    var selectorHeight: CGFloat = 80
    var spacerWithd: CGFloat = 40
    
    
    var fontUsed = Font.custom(fontsEnum.bold.rawValue, size: 15)
    
    var weappons = [typesOfWeappons.assalt.rawValue, typesOfWeappons.heavy.rawValue]
    @State private var weapponSelection = 0
    
    var typeShoots = [typeOfDiceSelector.uno.rawValue, typeOfDiceSelector.d3.rawValue, typeOfDiceSelector.d6.rawValue]
    @State private var typeShootsSelection = 0
    @State private var showSelection: Bool = false
    
    @State private var typeShoot: typeOfDiceSelector = .uno
    
    
    
    @State var isAutohit: Bool = false
    var keyboardType = UIKeyboardType.numberPad
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("name:").font(fontUsed)
            ZStack{
                Capsule().foregroundColor(colorWhite).frame(width: 260, height: 40, alignment: .center)
                Capsule().foregroundColor(colorGreen).frame(width: 255, height: 35, alignment: .center)
                       
                
                TextField("Enter name:", text: $name)
                    .font(.custom(fontsEnum.bold.rawValue, size: 30))
                    .foregroundColor(colorWhite)
                    .multilineTextAlignment(.center)
                    .keyboardType(.default)
            }.frame(width: 255, height: 45, alignment: .bottom)
            
            /*-----------------------------------------------------*/
            
            Spacer()
            Picker(selection: $weapponSelection, label: Text("type")) {
               ForEach(0 ..< weappons.count) {
                  Text(self.weappons[$0])
               }
            }
                .font(fontUsed)
                .frame(height: selectorHeight,alignment: .leading)
            
            /*-----------------------------------------------------*/
            
            Spacer()
            HStack(alignment: .bottom) {
                Text("Range:").font(.custom(fontsEnum.bold.rawValue, size: 15))
                ZStack{
                    Capsule().foregroundColor(colorWhite).frame(width: 60, height: 40, alignment: .center)
                    Capsule().foregroundColor(colorGreen).frame(width: 55, height: 35, alignment: .center)
                           
                    
                    TextField("Enter name:", text: $name)
                        .font(.custom(fontsEnum.bold.rawValue, size: 30))
                        .foregroundColor(colorWhite)
                        .multilineTextAlignment(.center)
                        .keyboardType(keyboardType)
                }
                    .frame(width: 55, height: 45, alignment: .bottom)
                
                Spacer()
                    .frame(width: spacerWithd)
                
                /*+++++++++++++++++++++++++++++++++++++++++++++++++*/
                
                Text("Is Autohit?")
                    .font(fontUsed)
                ZStack {
//                    RoundedRectangle(cornerRadius: 5)
//                        .frame(width: 40, height: 40)
//                        .foregroundColor(colorGreen)
//
                    Button(action: {
                        print("sign up bin tapped")
                        self.isAutohit = !self.isAutohit
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(colorGreen)
                            if (!self.isAutohit) {
                                Image(systemName: "checkmark").font(.system(size: 35, weight: .bold)).foregroundColor(colorWhite)
                            }
                            
                        }
                    }
                }
            }
            
            /*-----------------------------------------------------*/
            
            HStack {
                Text("Shoots:")
                    .font(fontUsed)
                ZStack{
                    Capsule().foregroundColor(colorWhite).frame(width: 60, height: 40, alignment: .center)
                    Capsule().foregroundColor(colorGreen).frame(width: 55, height: 35, alignment: .center)
                           
                    
                    TextField("Enter name:", text: $name)
                        .font(.custom(fontsEnum.bold.rawValue, size: 30))
                        .foregroundColor(colorWhite)
                        .multilineTextAlignment(.center)
                        .keyboardType(keyboardType)
                }
                    .frame(width: 55, height: 45, alignment: .bottom)
                
                /*++++++++++++++++++++++++++++++++++++++++++++++++++*/
                Spacer()
                    .frame(width: spacerWithd)
                
                Text("Type:")
                    .font(fontUsed)
                
                Button(action: {
                    print("sign up bin tapped")
                    self.isAutohit = !self.isAutohit
                    self.showSelection = !self.showSelection
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 60, height: 40)
                            .foregroundColor(colorGreen)
                        Text(self.typeShoot.rawValue)
                            .font(.system(size: 35, weight: .bold)).foregroundColor(colorWhite)
                        
                        
                    }.actionSheet(isPresented: $showSelection) {
                        ActionSheet(title: Text("Hit"), message: Text("Choose type of hit"), buttons: [.default(Text(typeOfDiceSelector.uno.rawValue)) {
                                self.typeShoot = typeOfDiceSelector.uno
                            }, .default(Text(typeOfDiceSelector.d3.rawValue)){
                                self.typeShoot = typeOfDiceSelector.d3
                            },
                            .default(Text(typeOfDiceSelector.d6.rawValue)){
                                self.typeShoot = typeOfDiceSelector.d6
                            }
                            ])
                    }
                }
            }
           
            /*-----------------------------------------------------*/
            
            Spacer()
            HStack(alignment: .bottom){
                Text("Strength:").font(.custom(fontsEnum.bold.rawValue, size: 15))
                ZStack{
                    Capsule().foregroundColor(colorWhite).frame(width: 60, height: 40, alignment: .center)
                    Capsule().foregroundColor(colorGreen).frame(width: 55, height: 35, alignment: .center)
                           
                    
                    TextField("0", text: $name)
                        .font(.custom(fontsEnum.bold.rawValue, size: 30))
                        .foregroundColor(colorWhite)
                        .multilineTextAlignment(.center)
                        .keyboardType(keyboardType)
                }.frame(width: 55, height: 45, alignment: .bottom)
                Spacer()
//                    .frame(width: 80)
                Text("A.P.:").font(.custom(fontsEnum.bold.rawValue, size: 15))
                ZStack{
                    Capsule().foregroundColor(colorWhite).frame(width: 60, height: 40, alignment: .center)
                    Capsule().foregroundColor(colorGreen).frame(width: 55, height: 35, alignment: .center)
                           
                    
                    TextField("Enter name:", text: $name)
                        .font(.custom(fontsEnum.bold.rawValue, size: 30))
                        .foregroundColor(colorWhite)
                        .multilineTextAlignment(.center)
                        .keyboardType(keyboardType)
                }.frame(width: 55, height: 45, alignment: .bottom)
            }

            
        }.background(colorDarkBlue)
        
    }
}

struct addWeapponScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddWeapponScreen().environment(\.colorScheme, .dark)
    }
}
