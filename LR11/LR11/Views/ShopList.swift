//
//  ShopList.swift
//  LR11
//
//  Created by infstka on 10.05.23.
//

import SwiftUI

struct ShopList: View {
    var body: some View {
        
        NavigationView {
            List(shops) { shopElem in
                NavigationLink(
                    destination:
                        ShopDetail(shopItem: shopElem)) {
                    ShopRow(shop: shopElem)
                }
            }
            .navigationTitle("Shop List")
        }
    }
}

struct ShopList_Previews: PreviewProvider {
    static var previews: some View {
        ShopList()
    }
}
