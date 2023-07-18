//
//  Menu.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 06/07/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
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
                    TextField("", text: $searchText).padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1).overlay(
                                    Image(systemName: "magnifyingglass").resizable().scaledToFill().padding(.trailing, 340).frame(width: 20, height: 20) .opacity(searchText.isEmpty ? 1 : 0)
                                    
                                    
                                    
                                )
                        ).frame(width: 395, alignment: .leading)
                }.frame(width: 500, height: 318).background(Color("primary1"))
                Spacer()
                Text("ORDER FOR DELIVERY!").font(Font.custom("Karla-ExtraBold", size: 20)).padding(10).frame(width: 410, height: 50, alignment: .leading)
                Spacer(minLength: 0)
                
                List {
                    
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Text("Starters").font(Font.custom("Karla-ExtraBold", size: 16)).foregroundColor(Color("primary1"))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 12)
                                .background(Color("Color 1"))
                                .cornerRadius(16)
                        }).frame(width: 110)
                        Spacer(minLength: 0)
                        Button(action: {
                            
                        }, label: {
                            Text("Main").font(Font.custom("Karla-ExtraBold", size: 16)).foregroundColor(Color("primary1"))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 12)
                                .background(Color("Color 1"))
                                .cornerRadius(16)
                        }).frame(width: 74
                        )
                        Spacer(minLength: 0)
                        Button(action: {
                            
                        }, label: {
                            Text("Desserts").font(Font.custom("Karla-ExtraBold", size: 16)).foregroundColor(Color("primary1"))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 12)
                                .background(Color("Color 1"))
                                .cornerRadius(16)
                        }).frame(width: 110)
                        Spacer(minLength: 0)
                        Button(action: {
                            
                        }, label: {
                            Text("Drinks").font(Font.custom("Karla-ExtraBold", size: 16)).foregroundColor(Color("primary1"))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 12)
                                .background(Color("Color 1"))
                                .cornerRadius(16)
                        }).frame(width: 87)
                        Spacer()
                    }.frame(width: 420,height: 30, alignment: .leading).padding()
                    
                    
                }.listStyle(PlainListStyle()).frame(width: 400, height: 84, alignment: .top).padding(.top, 0)
                
                
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                
                    List {
                        
                        ForEach(dishes, id: \.self) { dish in
                            if (dish.title! == "Bruschetta") {
                                VStack {
                                    Text("Bruschetta").font(Font.custom("Karla-Bold", size: 18)).padding(.trailing, 300).frame(width: 450)
                                    HStack {
                                        VStack {
                                            Text("Oven-baked bruschetta stuffed with tomatos and herbs.").font(Font.custom("Karla-Regular", size: 16)).padding(.trailing, 10).frame(width: 284)
                                            Text("$10").font(Font.custom("Karla-Medium", size: 16)).padding(.trailing, 255).frame(width: 300, height: 10)
                                        }
                                        Spacer(minLength: 26)
                                        Image("Bruschetta").resizable().scaledToFill().frame(width: 90, height: 90).clipped()
                                    }.frame(width: 390)
                                }
                            }
                            if (dish.title! == "Pasta") {
                                VStack {
                                    Text("Pasta").font(Font.custom("Karla-Bold", size: 18)).padding(.trailing, 350).frame(width: 450)
                                    HStack {
                                        VStack {
                                            Text("Penne with fried aubergines, cherry tomatoes, tomato sauce, fresh chilli, garlic, basil & salted ricotta cheese.").font(Font.custom("Karla-Regular", size: 16)).padding(.trailing, 10).frame(width: 284)
                                            Text("$10").font(Font.custom("Karla-Medium", size: 16)).padding(.trailing, 255).frame(width: 300, height: 10)
                                        }
                                        Spacer(minLength: 26)
                                        Image("Pasta").resizable().scaledToFill().frame(width: 90, height: 90).clipped()
                                    }.frame(width: 390)
                                }
                            }
                            if (dish.title! == "Grilled Fish") {
                                VStack {
                                    Text("Grilled Fish").font(Font.custom("Karla-Bold", size: 18)).padding(.trailing, 302).frame(width: 400)
                                    HStack {
                                        VStack {
                                            Text("Our Bruschetta is made from grilled bread that has been smeared with garlic and seasoned with salt and olive oil.").font(Font.custom("Karla-Regular", size: 16)).padding(.trailing, 0).frame(width: 284)
                                            Text("$10").font(Font.custom("Karla-Medium", size: 16)).padding(.trailing, 255).frame(width: 300, height: 10)
                                        }
                                        Spacer(minLength: 26)
                                        Image("Grilled fish").resizable().scaledToFill().frame(width: 90, height: 90).clipped()
                                    }.frame(width: 390)
                                }
                            }
                            if (dish.title! == "Lemon Desert") {
                                VStack {
                                    Text("Lemon Dessert").font(Font.custom("Karla-Bold", size: 18)).padding(.trailing, 270).frame(width: 450)
                                    HStack {
                                        VStack {
                                            Text("Traditional homemade Italian Lemon Ricotta Cake.").font(Font.custom("Karla-Regular", size: 16)).padding(.trailing, 60).frame(width: 284)
                                            Text("$10").font(Font.custom("Karla-Medium", size: 16)).padding(.trailing, 255).frame(width: 300, height: 10)
                                        }
                                        Spacer(minLength: 26)
                                        Image("Lemon dessert").resizable().scaledToFill().frame(width: 90, height: 90).clipped()
                                    }.frame(width: 390)
                                }
                            }
                            if (dish.title! == "Greek Salad") {
                                VStack {
                                    Text("Greek Salad").font(Font.custom("Karla-Bold", size: 18)).padding(.trailing, 299).frame(width: 430)
                                    HStack {
                                        VStack {
                                            Text("The famous greek salad of crispy lettuce, peppers, olives, our Chicago.").font(Font.custom("Karla-Regular", size: 16)).padding(.trailing, 20).frame(width: 284)
                                            Text("$10").font(Font.custom("Karla-Medium", size: 16)).padding(.trailing, 255).frame(width: 300, height: 10)
                                        }
                                        Spacer(minLength: 26)
                                        Image("Greek salad").resizable().scaledToFill().frame(width: 90, height: 90).clipped()
                                    }.frame(width: 390)
                                }
                            }
                        }
                    }.listStyle(PlainListStyle()).frame(width: 400, height: 439, alignment: .top).padding(.top, 0)
                
                }
                
                    
            }.onAppear(){if (d==0) {getMenuData()
                d = 1}
            }.toolbar {
                
                
                
                Image("Logo").padding(33)
                Spacer()
                    Image("Profile").resizable().scaledToFill().frame(width: 44, height: 44).clipped()
                Spacer()
                
            }.navigationBarBackButtonHidden(true)
            }.navigationBarBackButtonHidden(true)
        }
    }
    
    func  getMenuData() {
           PersistenceController.shared.clear()
           let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
           let urlR = URLRequest(url: url!)
           let task = URLSession.shared.dataTask(with: urlR) {
               url, response, error in
                   if let url {
                   let menuItem = try! JSONDecoder().decode(MenuList.self, from: url)
                   for item in menuItem.menu {
                       let newDish = Dish(context: viewContext)
                       newDish.title = item.title
                       newDish.image = item.image
                       newDish.price = item.price
                       newDish.desc = item.description
                   }
                   try? viewContext.save()
               }
           }
           task.resume()
       }
    
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]    }
    
    func buildPredicate() -> NSPredicate {
        if (searchText.isEmpty) {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
