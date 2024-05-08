//
//  NotesInteractor.swift
//  ViperNotesSwiftUI
//
//  Created by Oscar David Myerston Vega on 6/05/24.
//

import Foundation
import Combine

class NotesInteractor {

    private let formatter = DateFormatter()
    private let model: DataLayer
    private var cancellables = Set<AnyCancellable>()
    @Published var noteViewModels: [NoteViewModel] = []

    init (model: DataLayer) {
        formatter.dateStyle = .medium
        self.model = model
        setup()
    }

    // MARK: Private functions
    private func setup() {
        self.model.$notes
            .map({ notes -> [NoteViewModel] in
                return notes.map{
                    NoteViewModel(title: $0.title, body: $0.body, date: self.formatter.string(from: $0.date), id: $0.id)
                }
            })
            .replaceError(with: [])
            .assign(to: \.noteViewModels, on: self)
            .store(in: &cancellables)
    }

    // MARK: Public functions

    func showAddButton() -> Bool {
        noteViewModels.count < 10
    }

    func deleteAllNotes() {
        model.deleteAllNotes()
    }

    func addNewNote() {
        model.addNewNote(title: "Note \(noteViewModels.count)", body: "Note body", date: Date() )
    }

    func deleteNote(_ index: IndexSet) {

        var notesCopy = noteViewModels
        notesCopy.move(fromOffsets: index, toOffset: 0)

        if let noteToDelete = model.notes.filter({ notesCopy.first!.id == $0.id }).first {
            model.delete(noteToDelete)
        }
    }
}
