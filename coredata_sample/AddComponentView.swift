//
//  AddComponentView.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//

import SwiftUI

struct AddComponentView: View {
    
    @Binding var isPresented: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var componentName = ""
    
    var body: some View {
        VStack {
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
        
        component.componentName = self.componentName
        
        try? viewContext.save()
    }
}

struct AddComponentView_Previews: PreviewProvider {
    @State static var isPresented = true
    static var previews: some View {
        AddComponentView(isPresented: $isPresented)
    }
}
