//
//  NativeChatApp.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

@main
struct NativeChatApp: App {
    @StateObject private var chatViewModel = ChatViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(chatViewModel)
                .onOpenURL(perform: openURL)
        }
        .windowStyle(.hiddenTitleBar)
        Settings {
            SettingsView()
                .background(VisualEffectView(material: .popover, blendingMode: .behindWindow))
                .environmentObject(chatViewModel)
                .frame(width: 350, height: chatViewModel.showingLogs ? 600 : 300)

        }
    }

    private func openURL(_ url: URL) {
        guard let streamername = url.absoluteString.split(separator: "/").last else { return }
        chatViewModel.connect(to: String(streamername))
    }
}
