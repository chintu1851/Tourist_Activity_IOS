//
//  Tourist_ActivitiesApp.swift
//  Tourist_Activities
//
//  Created by Patel Chintan on 2023-03-01.
//

import SwiftUI
@main
struct Tourist_ActivitiesApp: App {
    var appData : AppData = AppData()
    var body: some Scene {
        WindowGroup {
            Login().environmentObject(appData)
        }
    }
}
