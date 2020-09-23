//
//  Component+CoreDataProperties.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//
//

import Foundation
import CoreData


extension Component {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Component> {
        return NSFetchRequest<Component>(entityName: "Component")
    }

    @NSManaged public var componentName: String?
    @NSManaged public var origin: Computer?

    public var wrappedComponentName: String {
        componentName ?? "Unknown component"
    }
}

extension Component : Identifiable {

}
