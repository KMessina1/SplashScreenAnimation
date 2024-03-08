/*--------------------------------------------------------------------------------------------------------------------------
File: SplashScreenAnimationApp.swift
Author: Kevin Messina
Created: 1/11/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import SwiftUI

@main
struct SplashScreenAnimationApp: App {
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.scale(0.0, anchor: .center))
                    }
                    
                }
                .zIndex(2.0)
            }
        }
    }
}
