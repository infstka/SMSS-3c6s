//
//  ShopDetail.swift
//  LR11
//
//  Created by infstka on 10.05.23.
//

import SwiftUI

struct ShopDetail: View {
    
    @State private var progress = 0.01
    
    var shopItem: Shop
    
    var body: some View {
        
        ScrollView {
            
            ImageView(image:
                        shopItem.image
                        .resizable()
            )
                .ignoresSafeArea(edges: .top)
                .padding()
            
            Text("Add progress to your shop")
            
            ProgressView(value: progress)
                .frame(height: 20.0)
            Button("Add", action: { progress += 0.05 })
            Divider()
            
            VStack(alignment: .leading){
                Text(shopItem.name)
                    .font(.title)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("Popularity: " + shopItem.popularity)
                        .foregroundColor(.secondary)
                    Spacer()
                    Link("Visit site",
                         destination: URL(string: shopItem.site)!)
                }
                .font(.title2)
                
                Divider()
                Text("About shop")
                    .font(.title2)
                Text(shopItem.description)
                
            }
            .padding()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity)
        .navigationTitle(shopItem.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetail(shopItem: shops[0])
    }
}
