//
//  AddComputerView.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//

import SwiftUI

struct AddComputerView: View {
    
    @Binding var isPresented: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var computerName = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("Computer name:", text: $computerName)
            }
            
            Button("Save computer") {
                saveComputer()
                isPresented = false
            }
        }

    }
    
    func saveComputer() {
        let computer = Computer(context: viewContext)
        
        computer.identifier = UUID()
        computer.computerName = self.computerName
        
        try? viewContext.save()
    }
}

struct AddComputerView_Previews: PreviewProvider {
    @State static var isPresented = true
    static var previews: some View {
        AddComputerView(isPresented: $isPresented)
    }
}
