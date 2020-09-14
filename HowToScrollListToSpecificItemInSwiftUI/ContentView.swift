//
//  ContentView.swift
//  HowToScrollListToSpecificItemInSwiftUI
//
//  Created by Ramill Ibragimov on 14.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    let publisher = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default).autoconnect()
    
    @State private var currentPosition = 20
    
    var body: some View {
        ScrollViewReader { scrollViewReader in
            List(1...100, id: \.self) { item in
                Text("Item \(item)")
                    .onTapGesture(count: 1, perform: {
                        withAnimation {
                            scrollViewReader.scrollTo(item, anchor: .top)
                        }
                    })
            }
            .onReceive(publisher, perform: { _ in
                currentPosition += 1
                
                withAnimation {
                    scrollViewReader.scrollTo(currentPosition, anchor: .top)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
