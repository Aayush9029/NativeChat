//
//  ChatViewModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    
    
    @Published var currentStatus: ChatStatus = .none
    @Published var chats: [ChatModel] = [ChatModel]()

    
    enum ChatStatus: String{
        case none = "Nothing has happened do something"
        case tryConnect = "Trying to connect"
        case opening = "Opening socket"
        case alreadyConnected = "Already connected re-doing the thing"
        case connecting = "Connecting to chat"
        case connectionError = "Error while connecting to chat"
        case connected = "We are connected to twitch chat"
    }
    // IRC Commands that can be send
    enum ChatCommand {
        case JOIN
        case PART
        case NICK
        case PONG
    }
    
    func connect(to channel: String){
        print("Connecting to \(channel)")
    }
    
}
