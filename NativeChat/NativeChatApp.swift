//
//  NativeChatApp.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

@main
struct NativeChatApp: App {
    @StateObject var chatViewModel = ChatViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(chatViewModel)

                .onOpenURL { url in
//                    Pass oauth between native twitch and or Oauth Library (github)
                    print(url)
                }
        }
        .windowStyle(.hiddenTitleBar)
        Settings{
            SettingsView()
                .background(VisualEffectView(material: .popover, blendingMode: .behindWindow))
                .environmentObject(chatViewModel)
                .frame(width: 350, height: chatViewModel.showingLogs ? 600 : 300)

        }
    }
}
