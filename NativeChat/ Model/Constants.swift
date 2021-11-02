//
//  Constants.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Cocoa

struct Constants{
//    Channel that is connected to, might use url schemes & App Storage (when opening with NativeTwitch app)
    static var connectedTo: String = "moistcr1tikal"

    static let oauthKey = "oauth:"
    static let username = "aahyoushh"
    
    // NickName is.. same as username unless.. 0.0
    static let nick = "aahyoushh"
    
    // Maximum number of chat messages displayed. Wanna save memory? make it 1 or 2..
    static let maxMessages = 40
}
