//
//  ContentView.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) private var computers: FetchedResults<Computer>

    @State private var showAddComputerView = false
    
    var body: some View {
        NavigationView {
            VStack {
                ContentCell()
                .padding(.top, 15)
                .navigationBarTitle(Text("CoreData Sample"))
                
                Text("This view scrolls horizontally 👉")
                    .padding(.bottom, 10)
                    .font(.title2)
            }
        }
        
        HStack {
            
            Button("Add Computer") {
                showAddComputerView.toggle()
            }.sheet(isPresented: $showAddComputerView, content: {
                AddComputerView(isPresented: $showAddComputerView)
            })
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
