//
//  Home.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 06/07/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                Menu().tabItem { Label("Menu", systemImage: "list.dash" ) }.environment(\.managedObjectContext, persistence.container.viewContext).tag(1)
                UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil" ) }.tag(2)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
