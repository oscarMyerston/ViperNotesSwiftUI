//
//  NotesRouter.swift
//  ViperNotesSwiftUI
//
//  Created by Oscar David Myerston Vega on 7/05/24.
//

import Foundation
import SwiftUI
import CoreData

struct NotesRouter {

    func listView(context: NSManagedObjectContext) -> some View {

        let persistence = CoreDataStack(context: context)
        let dataLayer = DataLayer(provider: persistence)
        let contentView = NotesListView(presenter: NotesPresenter(interactor: NotesInteractor(model: dataLayer)))

        return contentView
    }

    func detailView(note: NoteViewModel) -> some View {
        NotesDetailView(note: note)
    }
}
