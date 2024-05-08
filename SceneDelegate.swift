//
//  SceneDelegate.swift
//  ViperNotesSwiftUI
//
//  Created by Oscar David Myerston Vega on 7/05/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let router = NotesRouter()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: router.listView(context: context))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

