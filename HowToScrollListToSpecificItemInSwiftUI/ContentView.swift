//
//  ContentView.swift
//  HowToScrollListToSpecificItemInSwiftUI
//
//  Created by Ramill Ibragimov on 14.09.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollViewReader { scrollViewReader in
            List(1...100, id: \.self) { item in
                Text("Item \(item)")
                    .onTapGesture(count: 1, perform: {
                        withAnimation {
                            scrollViewReader.scrollTo(item)
                        }
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
