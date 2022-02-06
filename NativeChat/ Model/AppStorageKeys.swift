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
    case speakChat = "Is TTS enabled?"

    case oauthToken = "User Oauth Key"
    case username = "User name"

    case maxMessages = "Maximum number of messages displayed"

}
