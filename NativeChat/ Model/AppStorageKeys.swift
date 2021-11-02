//
//  AppStorageKeys.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Cocoa

enum AppStorageKeys: String {
    case chatSpacing = "Chat Row Spacing"
    case isMulitColored = "Is chat multicolored?"
    case fontSize = "Is Custom font size used?"

    // Note: this will be chaotic and unusable for streams with huge "chatters", perfect for small streams.
    // Show this alert when toggled.
    case speakChat = "Is TTS enabled?"
}

