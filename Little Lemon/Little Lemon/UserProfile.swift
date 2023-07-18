//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 07/07/23.
//

import SwiftUI

var firstName = UserDefaults.standard.string(forKey: kFirstName)
var lastName = UserDefaults.standard.string(forKey: kLastName)
var email = UserDefaults.standard.string(forKey: kEmail)
var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber)
var orderStatuses = UserDefaults.standard.bool(forKey: korderStatuses)
var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)


struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @State var shouldRefresh = false
    @State private var isLoggedOut = false

    var body: some View {
        NavigationView {
            VStack {
                

                VStack {
                    Spacer(minLength: 40)
                    Text("Personal information").font(Font.custom("Karla-Medium", size: 18)).frame(width: 395, height: 0,alignment: .leading)
                    Text("Avatar").font(Font.custom("Karla-Medium", size: 12)).foregroundColor(Color.gray).frame(width: 395, height: 40, alignment: .leading)
                    HStack { Image("Profile").resizable().scaledToFill().frame(width: 85, height: 85, alignment: .leading).clipped()
                        Button(action: {
                            
                        }, label: {
                            Text("Change").font(Font.custom("Karla-Medium", size: 16)).foregroundColor(.white)
                                .padding([.leading, .trailing], 15)
                                .padding([.top, .bottom], 12)
                                .background(Color("primary1"))
                                .cornerRadius(8).padding()
                        })
                        Button(action: {
                            
                        }, label: {
                            Text("Remove").font(Font.custom("Karla-Medium", size: 16)).foregroundColor(.gray)
                                .padding([.leading, .trailing], 15)
                                .padding([.top, .bottom], 12)
                                .border(Color.black, width: 1)
                            
                        })
                    }.frame(width: 395, height: 50,alignment: .leading)
                    
                    Text("First Name").font(Font.custom("Karla-Medium", size: 12)).foregroundColor(Color.gray).frame(width: 395, height: 15,alignment: .leading).padding()
                    Text(firstName!).font(Font.custom("Karla-Medium", size: 15)).frame(width: 348, height: 15,alignment: .leading).padding().padding(.trailing)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)).frame(width: 395, height: 15,alignment: .leading)
                    
                    Text("Last Name").font(Font.custom("Karla-Medium", size: 12)).foregroundColor(Color.gray).frame(width: 395, height: 15,alignment: .leading).padding()
                    Text(lastName!).font(Font.custom("Karla-Medium", size: 15)).frame(width: 348, height: 15,alignment: .leading).padding().padding(.trailing)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)).frame(width: 395, height: 15,alignment: .leading)
                    Text("Email").font(Font.custom("Karla-Medium", size: 12)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading).padding()
                    Text(email!).font(Font.custom("Karla-Medium", size: 15)).frame(width: 348, height: 15,alignment: .leading).padding().padding(.trailing)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)).frame(width: 395, height: 15,alignment: .leading)
                }
                VStack {
                    Text("Phone Number").font(Font.custom("Karla-Medium", size: 12)).foregroundColor(Color.gray).frame(width: 395, alignment: .leading).padding()
                    Text(phoneNumber!).font(Font.custom("Karla-Medium", size: 15)).frame(width: 348, height: 15,alignment: .leading).padding().padding(.trailing)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)).frame(width: 395, height: 15,alignment: .leading)
                    Spacer(minLength: 30)
                    Text("Email notifications *").font(Font.custom("Karla-Medium", size: 18)).frame(width: 395, alignment: .leading)
                    HStack {
                        
                        if (!orderStatuses) {
                            Image(systemName: "square").foregroundColor(Color("primary1"))
                        } else {
                            Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                        }
                        
                        
                        Text("Order statuses").font(Font.custom("Karla-Regular", size: 15))
                        
                    }.frame(width: 395,height: 20, alignment: .leading)
                    HStack {
                        
                        if (passwordChanges == false) {
                            Image(systemName: "square").foregroundColor(Color("primary1"))
                        } else {
                            Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                        }
                        
                        
                        Text("Password changes").font(Font.custom("Karla-Regular", size: 15))
                        
                    }.frame(width: 395, height: 20, alignment: .leading)
                    HStack {
                        
                        if (specialOffers == false) {
                            Image(systemName: "square").foregroundColor(Color("primary1"))
                        } else {
                            Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                        }
                        
                        
                        Text("Special offers").font(Font.custom("Karla-Regular", size: 15))
                        
                    }.frame(width: 395, height: 20, alignment: .leading)
                    HStack {
                        
                        if (newsletter == false) {
                            Image(systemName: "square").foregroundColor(Color("primary1"))
                        } else {
                            Image(systemName: "checkmark.square.fill").foregroundColor(Color("primary1"))
                        }
                        
                        
                        Text("Newsletter").font(Font.custom("Karla-Regular", size: 15))
                        
                    }.frame(width: 395, height: 20, alignment: .leading)
                    
                }
                Spacer(minLength: 5)
                Button("Logout") {
                    
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    isLoggedOut = true
                    
                    
                }.font(Font.custom("Karla-Medium", size: 18)).foregroundColor(.black)
                    .padding([.leading, .trailing], 165)
                    .padding([.top, .bottom], 12)
                    .background(Color("primary2"))
                    .border(Color("primary3"), width: 1).cornerRadius(8).padding(10)
                Spacer(minLength: 0)
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Discard changes").font(Font.custom("Karla-Medium", size: 16)).foregroundColor(.gray)
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1))
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Save changes").font(Font.custom("Karla-Medium", size: 16)).foregroundColor(.white)
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 12)
                            .background(Color("primary1"))
                            .cornerRadius(8).padding()
                        
                    })
                }
                Spacer(minLength: 10)
                
                
            }.fullScreenCover(isPresented: $isLoggedOut) {
                Onboarding().transition(.move(edge: .trailing))
            }.transition(.move(edge: .trailing))
            .toolbar {
                
                
                
                Image("Logo").padding(33)
                Spacer()
                Image("Profile").resizable().scaledToFill().frame(width: 44, height: 44).clipped()
                Spacer()
                
            }.navigationViewStyle(StackNavigationViewStyle())    }.navigationBarBackButtonHidden(true)

    }
    
    func clearFields() {
        
    UserDefaults.standard.set(firstName, forKey: kFirstName)
        
    
        
    UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
    
    
    UserDefaults.standard.set(lastName, forKey: kLastName)
        
    UserDefaults.standard.set(orderStatuses, forKey: korderStatuses)
        
    UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
        
    UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
       
    UserDefaults.standard.set(newsletter, forKey: kNewsletter)
        
    UserDefaults.standard.set(email, forKey: kEmail)
    }
    
    func refreshData() {
        firstName = UserDefaults.standard.string(forKey: kFirstName)
        lastName = UserDefaults.standard.string(forKey: kLastName)
        email = UserDefaults.standard.string(forKey: kEmail)
        phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber)
        orderStatuses = UserDefaults.standard.bool(forKey: korderStatuses)
        passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
        specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
        newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    }

}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
