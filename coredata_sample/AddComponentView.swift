//
//  AddComponentView.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//

import SwiftUI

struct AddComponentView: View {
    
    @Binding var isPresented: Bool
    
    let computerData: Computer
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var componentName = ""
    
    var body: some View {
        VStack {
            
            Text("Targeting \(computerData.wrappedComputerName)")
                .font(.title2)
                .foregroundColor(.blue)
            
            Form {
                TextField("Component name:", text: $componentName)
            }
            
            Button("Save component") {
                isPresented = false
                saveComponent()
            }
        }
    }
    
    func saveComponent() {
        let component = Component(context: viewContext)
        let computer = Computer(context: viewContext)
        
        component.componentName = self.componentName
        component.origin = computer
        
        try? viewContext.save()
        print("🚒 Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
    }
}

//struct AddComponentView_Previews: PreviewProvider {
//    @State static var isPresented = true
//    static var previews: some View {
//        AddComponentView(isPresented: $isPresented)
//    }
//}
