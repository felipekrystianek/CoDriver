//
//  co_driverApp.swift
//  co-driver
//
//  Created by Krystian Filipek on 20/12/2022.
//

import SwiftUI

@main
struct co_driverApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
