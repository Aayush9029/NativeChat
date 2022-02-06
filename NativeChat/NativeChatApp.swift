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
                if let streamername = url.absoluteString.split(separator: "/").last {
                    chatViewModel.connect(to: String(streamername))
                }
            }
        }
        .windowStyle(.hiddenTitleBar)
        Settings {
            SettingsView()
                .background(VisualEffectView(material: .popover, blendingMode: .behindWindow))
                .environmentObject(chatViewModel)
                .frame(width: 350, height: chatViewModel.showingLogs ? 600 : 300)

        }
    }
}
