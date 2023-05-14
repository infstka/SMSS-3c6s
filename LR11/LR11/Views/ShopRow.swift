//
//  ShopRow.swift
//  LR11
//
//  Created by infstka on 9.05.23.
//

import SwiftUI

struct ShopRow: View {
    
    var shop: Shop
    var body: some View {
        
        HStack {
            shop.image.resizable().frame(width: 100, height: 100)
            Text(shop.name)
                .font(.title2)
                .foregroundColor(.primary)
            Spacer()
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.627, blue: 0.478)/*@END_MENU_TOKEN@*/)
    }
}

struct ShopRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShopRow(shop: shops[0])
            ShopRow(shop: shops[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
