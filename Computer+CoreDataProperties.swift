//
//  Computer+CoreDataProperties.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//
//

import Foundation
import CoreData


extension Computer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Computer> {
        return NSFetchRequest<Computer>(entityName: "Computer")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var computerName: String?
    @NSManaged public var component: NSSet?

    public var wrappedComputerName: String {
        computerName ?? "Unknown computer name"
    }
    
    public var serviceArray: [Component] {
        let set = component as? Set<Component> ?? []
        
        return set.sorted {
            $0.wrappedComponentName < $1.wrappedComponentName
        }
    }
}

// MARK: Generated accessors for component
extension Computer {

    @objc(addComponentObject:)
    @NSManaged public func addToComponent(_ value: Component)

    @objc(removeComponentObject:)
    @NSManaged public func removeFromComponent(_ value: Component)

    @objc(addComponent:)
    @NSManaged public func addToComponent(_ values: NSSet)

    @objc(removeComponent:)
    @NSManaged public func removeFromComponent(_ values: NSSet)

}

extension Computer : Identifiable {

}
