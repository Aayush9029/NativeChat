//
//  Accessibility.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Cocoa


struct Accessibility {
    static let chatSpacing = 0
    static let isMulitColored = true
    static let speakChat = false
    static let fontSize: fontTypes = .medium
}


// MARK:  "Custom" Font Types
enum fontTypes: String {
    case verySmall = "Very small" // caption2
    case small = "Small" // caption
    case mediumSmall = "Medium-Small-ish" // subheadline
    case medium = "Medium" //title3
    case mediumLarge = "Medium-Large-ish" //title2
    case large = "Large" // title
    case extraLarge = "Extra Large" // largeTitle
}
