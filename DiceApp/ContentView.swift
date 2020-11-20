//
//  ContentView.swift
//  DiceApp
//
//  Created by Renan Baialuna on 11/11/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
    
    let weapponsList = [
        Weappon(objectID: "1",
            type: .pistol,
            name: "Plasma Pistol Standard",
            range: 12,
            numberOfShots: 1,
            shootsCountType: .uno,
            strength: 7,
            armorPenetration: 2,
            damage: 1,
            damageCountType: .uno,
            weapponHitModifier: .none,
            weapponWondModifier: .none
        ),
        
        Weappon(objectID: "2",
            type: .pistol,
            name: "Plasma Pistol Supercharged",
            range: 12,
            numberOfShots: 1,
            shootsCountType: .d3,
            strength: 8,
            armorPenetration: 3,
            damage: 2,
            damageCountType: .uno,
            weapponHitModifier: .none,
            weapponWondModifier: .none
        )
        
    ]
    var body: some View {
        
        NavigationView{
            
            List(weapponsList) { weappon in
                HStack {
                    Spacer()
                    if weappon.shootsCountType != .uno {
                        VerticalSubview(
                            nameFirst: "Shoots",
                            valueFirst: "\(weappon.numberOfShots)\(weappon.shootsCountType)",
                            nameSeccond: "Strengt",
                            valueSeccond: "\(weappon.strength)")
                    } else {
                        VerticalSubview(
                            nameFirst: "Shoots",
                            valueFirst: "\(weappon.numberOfShots)",
                            nameSeccond: "Strengt",
                            valueSeccond: "\(weappon.strength)")
                    }
                    
                    Spacer()
                    VStack(alignment: .trailing) {
                        Spacer()
                        VerticalSubview(
                            nameFirst: "AP",
                            valueFirst: "-\(weappon.armorPenetration)",
                            nameSeccond: "Damage",
                            valueSeccond: "\(weappon.damage)")
                        Spacer()
                    }
                    Spacer()
                }
                .background(Color(UIColor(named: ColorsEnum.seccond.rawValue)!))
                
            }
            .aspectRatio(contentMode: .fill)
            .padding([.top, .leading, .trailing])
            .navigationBarTitle("Weapon List", displayMode: .inline)
            .navigationBarItems(trailing:
//                Button(action: {
//
//                }) {
//                    Image(systemName: "plus.circle").font(.system(size: 30, weight: .bold))
//                }
                    NavigationLink(destination: AddWeapponScreen()) {
                        Image(systemName: "plus.circle").font(.system(size: 30, weight: .bold))
                    }
                
            )
            .onAppear {
               UITableView.appearance().separatorStyle = .none
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}

