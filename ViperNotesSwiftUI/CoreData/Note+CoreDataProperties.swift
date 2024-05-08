//
//  Note+CoreDataProperties.swift
//  ViperNotesSwiftUI
//
//  Created by Oscar David Myerston Vega on 6/05/24.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String
    @NSManaged public var date: Date
    @NSManaged public var id: UUID
    @NSManaged public var title: String

}

extension Note : Identifiable {

}
