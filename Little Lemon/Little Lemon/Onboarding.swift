//
//  OnboardingView.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 17/07/23.
//

import SwiftUI

let kFirstName = "first name key"


let kPhoneNumber = "phone number key"

let kLastName = "last name key"
let korderStatuses = "order statuses key"
let kPasswordChanges = "password changes key"
let kSpecialOffers = "special offers key"
let kNewsletter = "newsletter key"
let kIsLoggedIn = "kIsLoggedIn"
let kEmail = "email key"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

struct Onboarding: View {
    @State var firstName = ""
   
    
    @State var phoneNumber = ""
    @State var lastName = ""
    
    
    @State var orderStatuses = false
    @State var passwordChanges = false
    @State var specialOffers = false
    @State var newsletter = false
    @State var isLoggedIn = false
    @State var email = ""
    @State private var currentPageIndex = 0
    @State var shouldRefresh = false
    private let pageCount = 3
    var body: some View {
            ZStack {
                // Pagina 1
                NavigationView {
                    VStack {
                        Spacer(minLength: 20)
                        
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
                                        
                                        
                                        
                                        currentPageIndex = 1
                                    }
                                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                                    .padding([.leading, .trailing], 50)
                                    .padding([.top, .bottom], 12)
                                    .background(Color("primary2"))
                                    .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                            }
                            
                        }
                        Spacer(minLength: 15)
                    }
                    .toolbar {
                        
                        Image("Logo").padding(200)
                        
                    }
                    
                }.navigationBarBackButtonHidden(true)
                
                
                .opacity(currentPageIndex == 0 ? 1 : 0)
                NavigationView {
                    VStack {
                        Spacer(minLength: 20)
                        
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
                                    
                                    currentPageIndex = 0
                                    
                                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                                    .padding([.leading, .trailing], 50)
                                    .padding([.top, .bottom], 12)
                                    .background(Color("primary2"))
                                    .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                                
                                Spacer()
                                Button("Next") {
                                    
                                    if (  phoneNumber.isEmpty == false && lastName.isEmpty == false) {
                                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                                        
                                        
                                        UserDefaults.standard.set(lastName, forKey: kLastName)
                                        currentPageIndex = 2
                                    }
                                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                                    .padding([.leading, .trailing], 50)
                                    .padding([.top, .bottom], 12)
                                    .background(Color("primary2"))
                                    .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                                
                            }
                        }
                        Spacer(minLength: 15)
                    }
                    .toolbar {
                        
                        Image("Logo").padding(200)
                        
                    }
                    
                }.navigationBarBackButtonHidden(true)
                // Pagina 2
                
                
                .opacity(currentPageIndex == 1 ? 1 : 0)
                NavigationView {
                    VStack {
                        Spacer(minLength: 20)
                        NavigationLink(destination: Home(), isActive: $isLoggedIn) {
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
                            HStack {
                                Button("Back") {
                                   
                                    currentPageIndex = 1
                                    
                                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                                    .padding([.leading, .trailing], 50)
                                    .padding([.top, .bottom], 12)
                                    .background(Color("primary2"))
                                    .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                                
                                Spacer()
                                Button("Register") {
                                    if (  email.isEmpty == false && emailPred.evaluate(with: email)) {
                                        UserDefaults.standard.set(email, forKey: kEmail)
                                        
                                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                        UserDefaults.standard.set(orderStatuses, forKey: korderStatuses)
                                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                                        shouldRefresh = true // Aggiorna il valore di shouldRefresh
                                        isLoggedIn = true
                                    }
                                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                                    .padding([.leading, .trailing], 35)
                                    .padding([.top, .bottom], 12)
                                    .background(Color("primary2"))
                                    .border(Color("primary3"), width: 1).cornerRadius(8).padding()
                                
                            }
                            
                            
                        }
                        Spacer(minLength: 15)
                    }.onAppear() {if !UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        clearFields()
                        currentPageIndex = 0
                    }
                        
                    }.toolbar {
                        
                        Image("Logo").padding(200)
                        
                    }
                    
                }.navigationBarBackButtonHidden(true)
                // Pagina 3
                
                
                .opacity(currentPageIndex == 2 ? 1 : 0)
            }
            
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarHidden(true)
            
        }
    
    func clearFields() {
            firstName = ""
        
            phoneNumber = ""
        
            lastName = ""
       
        
        
        
            orderStatuses = false
        
            passwordChanges = false
        
            specialOffers = false
       
            newsletter = false
        
            email = ""
        
        }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
