//
//  Onboarding1.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 05/07/23.
//

import SwiftUI

let kFirstName = "first name key"

let kIsLoggedIn1 = "kIsLoggedIn1"

struct Onboarding1: View {
    @State var firstName = ""
   
    @State var isLoggedIn1 = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 20)
                NavigationLink(destination: Onboarding2(), isActive: $isLoggedIn1) {
                    EmptyView()
                }
                VStack {
                    Text("Little Lemon").font(Font.custom("MarkaziText-Medium", size: 64)).foregroundColor(Color("primary2")).padding(-20).frame(width: 360, alignment: .leading)
                    
                    HStack {
                        VStack {
                            
                            Text("Chicago").font(Font.custom("MarkaziText-Regular", size: 40)).foregroundColor(Color.white).padding(-10).frame(width: 207, alignment: .leading)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional\nrecipes served with a modern twist.").font(Font.custom("Karla-Medium", size: 18)).foregroundColor(Color.white).padding(10).frame(width: 245, alignment: .leading)
                        }
                        Image("Hero image").resizable().scaledToFill().frame(width: 152, height: 155).clipped().cornerRadius(16)
                    }.frame(width: 415, alignment: .leading)
                }.frame(width: 500, height: 248).background(Color("primary1"))
                Spacer()
                VStack {
                    Text("First Name *").font(Font.custom("Karla-Medium", size: 18)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading)
                    TextField("First Name", text: $firstName).padding().frame(width: 395, alignment: .leading).background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Next") {
                            if (firstName.isEmpty == false ) {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                
                                
                                isLoggedIn1 = true
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn1)
                            }
                        }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                            .padding([.leading, .trailing], 50)
                            .padding([.top, .bottom], 12)
                            .background(Color("primary2"))
                            .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                    }
                    
                }
                Spacer(minLength: 15)
            }.onAppear() {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn1)) {
                    isLoggedIn1 = true
                }
            }.toolbar {
                
                Image("Logo").padding(200)
                
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}
