//
//  ChatModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Cocoa

class ChatMessageModel: NSObject {
    // user name and message content
    var user: String
    var content: String
    
    // initializer
    init(user: String, content: String) {
        self.user = user
        self.content = content
    }
    
    
    // assign color to username
    class func nameColor(username: String) -> NSColor {
        let index = abs(username.hash % 1000) / 100
        return colors[index]
    }
    
    // available colors
    static let colors: [NSColor] = [
        NSColor(_colorLiteralRed: 1, green: 0.5, blue: 0, alpha: 1), // olive
        NSColor(_colorLiteralRed: 1, green: 0, blue: 0, alpha: 1), // red
        NSColor(_colorLiteralRed: 1, green: 1, blue: 0, alpha: 1), // yellow
        NSColor(_colorLiteralRed: 0, green: 0.5, blue: 0, alpha: 1), // green
        NSColor(_colorLiteralRed: 0, green: 1, blue: 0, alpha: 1), // lime
        NSColor(_colorLiteralRed: 0, green: 0.5, blue: 0.5, alpha: 1), // teal
        NSColor(_colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), // aqua
        NSColor(_colorLiteralRed: 0, green: 0, blue: 1, alpha: 1), // blue
        NSColor(_colorLiteralRed: 0.5, green: 0, blue: 0.5, alpha: 1), // purple
        NSColor(_colorLiteralRed: 1, green: 0.5, blue: 0, alpha: 1) // orange
    ]
    
}
