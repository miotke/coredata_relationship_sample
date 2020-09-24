//
//  ContentCell.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/23/20.
//

import SwiftUI

struct ContentCell: View {
    
    @FetchRequest(sortDescriptors: []) private var computers: FetchedResults<Computer>
    
    @State private var showAddComponentView = false
    
    var body: some View {
        TabView {
            ForEach(computers, id:\.self) { computer in
                VStack {
                    Text(computer.wrappedComputerName )
                        .font(.title)
                    VStack {
                        HStack{
                            Text("Component list:")
                            
                            Button("Add Component") {
                                showAddComponentView.toggle()
                            }.sheet(isPresented: $showAddComponentView, content: {
                                AddComponentView(isPresented: $showAddComponentView, computerData: computer)
                            })
                        }
                        List {
                            ForEach(computer.serviceArray, id:\.self) { component in
                                Text("\(component.wrappedComponentName) for \(computer.wrappedComputerName) computer")
                            }
                        }
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct ContentCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentCell()
    }
}
