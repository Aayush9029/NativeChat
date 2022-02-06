//
//  SharedStatus.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import Foundation

struct SharedData {
    static var status: ChatStatus = .none
    static var connectedTo: String = "moistcr1tikal"
}

enum ChatStatus: String {
    case none = "Nothing has happened do something"
    case tryConnect = "Trying to connect"
    case invalidUrl = "Invalid wss url"
    case opening = "Opening socket"

    case alreadyConnected = "Already connected re-doing the thing"
    case connecting = "Connecting to chat"
    case connected = "We are connected to twitch chat"
    case closed = "Connection Terminated by the user"

    case messageReceived = "We got the message, it's working"
    case gotBadData = "We got weird data, not sure how to handle this"
    case gotGoodData = "We got good data yay!"
    case gotWeirdData = "We got unknown data type?!?!"

    case connectionError = "Error while connecting to chat"
    case disconnected = "Web Socket did disconnect"
}
