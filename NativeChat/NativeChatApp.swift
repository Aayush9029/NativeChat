//
//  NativeChatApp.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

@main
struct NativeChatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
//                    Pass oauth between native twitch and or Oauth Library (github)
                    print(url)
                }
        }
    }
}
