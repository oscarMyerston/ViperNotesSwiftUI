//
//  NotesListView.swift
//  ViperNotesSwiftUI
//
//  Created by Oscar David Myerston Vega on 7/05/24.
//

import Foundation
import SwiftUI

struct NotesListView: View {

    @StateObject var presenter: NotesPresenter

    var body: some View {
        NavigationView {
            List {
              ForEach (presenter.noteViewModels, id: \.id) { item in
                NavigationLink(item.title, destination: self.presenter.detailView(note: item))
              }
              .onDelete(perform: presenter.delete)
            }
            .navigationBarTitle("Notes", displayMode: .inline)
            .navigationBarItems(trailing:
                presenter.topButton()
            )
        }
    }
}

