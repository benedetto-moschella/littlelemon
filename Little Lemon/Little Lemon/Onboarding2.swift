//
//  Onboarding2.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 13/07/23.
//

import SwiftUI

let kPhoneNumber = "phone number key"
let kIsLoggedIn2 = "kIsLoggedIn2"
let kLastName = "last name key"


struct Onboarding2: View {
    @State var phoneNumber = ""
    @State var lastName = ""
    @State var isLoggedIn2 = false
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 20)
                NavigationLink(destination: Onboarding3(), isActive: $isLoggedIn2) {
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
                    Text("Last Name *").font(Font.custom("Karla-Medium", size: 18)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading)
                    TextField("Last Name", text: $lastName).padding().frame(width: 395, alignment: .leading).background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                   
                    Text("Phone Number *").font(Font.custom("Karla-Medium", size: 18)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading)
                    TextField("Phone Number", text: $phoneNumber) .autocapitalization(.none).padding().frame(width: 395, alignment: .leading).background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Spacer()
                    HStack {
                        Button("Back") {
                            UserDefaults.standard.set(false, forKey: kIsLoggedIn1)
                            self.presentation.wrappedValue.dismiss()
                        }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                            .padding([.leading, .trailing], 50)
                            .padding([.top, .bottom], 12)
                            .background(Color("primary2"))
                            .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                        
                        Spacer()
                        Button("Next") {
                            
                            if (  phoneNumber.isEmpty == false && lastName.isEmpty == false) {
                                UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                                
                                isLoggedIn2 = true
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn2)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
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
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn2)) {
                    isLoggedIn2 = true
                }
            }.toolbar {
                
                Image("Logo").padding(200)
                
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
