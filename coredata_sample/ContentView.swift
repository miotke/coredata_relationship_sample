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
    @State private var showAddComponentView = false
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(computers, id:\.self) { computer in
                        VStack {
                            Text(computer.wrappedComputerName )
                                .font(.title)
                            
                            List {
                                ForEach(computer.serviceArray, id:\.self) { component in
                                    Text("\(component.wrappedComponentName) for \(computer.wrappedComputerName) computer")
                                }
                            }
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
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
            
            Button("Add Component") {
                showAddComponentView.toggle()
            }.sheet(isPresented: $showAddComponentView, content: {
                AddComponentView(isPresented: $showAddComponentView)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
