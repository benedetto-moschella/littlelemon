//
//  Onboarding3.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 13/07/23.
//

import SwiftUI

let korderStatuses = "order statuses key"
let kPasswordChanges = "password changes key"
let kSpecialOffers = "special offers key"
let kNewsletter = "newsletter key"
let kIsLoggedIn3 = "kIsLoggedIn3"
let kEmail = "email key"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

struct Onboarding3: View {
    @State var orderStatuses = false
    @State var passwordChanges = false
    @State var specialOffers = false
    @State var newsletter = false
    @State var isLoggedIn3 = false
    @State var email = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 20)
                NavigationLink(destination: Home(), isActive: $isLoggedIn3) {
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
                    Text("Email *").font(Font.custom("Karla-Medium", size: 18)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading)
                    TextField("Email", text: $email) .autocapitalization(.none).padding().frame(width: 395, alignment: .leading).background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    VStack {
                        Text("Email notifications *").font(Font.custom("Karla-Medium", size: 18)).frame(width: 395, alignment: .leading)
                        
                        HStack {
                            Button(action: {
                                orderStatuses = !orderStatuses
                                UserDefaults.standard.set(orderStatuses, forKey: korderStatuses)
                            }, label: {
                                if (orderStatuses == false) {
                                    Image(systemName: "square").foregroundColor(Color("primary1"))
                                } else {
                                    Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                                }
                            })
                            
                            Text("Order statuses").font(Font.custom("Karla-Regular", size: 15))
                            
                        }.frame(width: 395, alignment: .leading).padding()
                        HStack {
                            Button(action: {
                                passwordChanges = !passwordChanges
                                UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                            }, label: {
                                if (passwordChanges == false) {
                                    Image(systemName: "square").foregroundColor(Color("primary1"))
                                } else {
                                    Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                                }
                            })
                            
                            Text("Password changes").font(Font.custom("Karla-Regular", size: 15))
                            
                        }.frame(width: 395, alignment: .leading)
                        HStack {
                            Button(action: {
                                specialOffers = !specialOffers
                                UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                            }, label: {
                                if (specialOffers == false) {
                                    Image(systemName: "square").foregroundColor(Color("primary1"))
                                } else {
                                    Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                                }
                            })
                            
                            Text("Special offers").font(Font.custom("Karla-Regular", size: 15))
                            
                        }.frame(width: 395, alignment: .leading).padding()
                        HStack {
                            Button(action: {
                                newsletter = !newsletter
                                UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                            }, label: {
                                if (newsletter == false) {
                                    Image(systemName: "square").foregroundColor(Color("primary1"))
                                } else {
                                    Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                                }
                            })
                            
                            Text("Newsletter").font(Font.custom("Karla-Regular", size: 15))
                            
                        }.frame(width: 395, alignment: .leading)
                    }.frame(height: 215)
                    Spacer()
                    
                    Button("Register") {
                        if (  email.isEmpty == false && emailPred.evaluate(with: email)) {
                            UserDefaults.standard.set(email, forKey: kEmail)
                            isLoggedIn3 = true
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn3)
                        }
                        
                    }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                        .padding([.leading, .trailing], 165)
                        .padding([.top, .bottom], 12)
                        .background(Color("primary2"))
                        .border(Color("primary3"), width: 1).cornerRadius(8).padding(10)
                    
                }
                Spacer(minLength: 15)
            }.onAppear() {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn3)) {
                    isLoggedIn3 = true
                }
            }.toolbar {
                
                Image("Logo").padding(200)
                
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
    }
}
