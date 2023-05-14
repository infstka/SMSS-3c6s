//
//  ContentView.swift
//  LR11
//
//  Created by infstka on 9.05.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        TabView() {
            
            LazyVStack(alignment: .center) {
                ImageView(image: Image("main_icon_128"))
                Text("Shops")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Here you will find your favorite one").font(.title3)
                Spacer()
                Text("In this app you will find unusual shops, which you can find interestion or not, depends on your tastes. So, choose any that you like, making progress, and have fun").font(.subheadline).multilineTextAlignment(.center)
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("Info")
                
            }
            ShopList()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Shop list")
                    
                }
            
        }
        .padding(.all, 5)
        .background(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
