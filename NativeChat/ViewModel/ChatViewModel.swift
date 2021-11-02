//
//  ChatViewModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI


class ChatViewModel: ObservableObject, IRCServerDelegate, IRCChannelDelegate{
    @Published var messages: [ChatMessageModel] = [ChatMessageModel]()
    @Published var logs: [String] = [String]()
    @Published var sendingText: String = ""
    var messageCount: Int = 0

    let session = URLSession(configuration: .default)
    
    let user = UserModel(
        // Use your own details here:
        username: Constants.username,
        nick: Constants.nick,
        password: Constants.oauthKey // not my real one!
    )
    var server: IRCServer
    var channel: IRCChannel?
    
    init(){
//        Connecting to twitches IRC server. "general server not a specific channel"
        server = IRCServer(
            hostname: "irc.chat.twitch.tv",
            port: 6667,
            user: user,
            session: session
        )
    }
    
    func connect(to channelName: String){
        // Join the channel you want. This seems to be case-sensitive.
        channel = server.join(channelName)
        server.delegate = self
        channel?.delegate = self
    }
    
    func sendMessage(){
        // Send a message:
        channel?.send(sendingText)
        messages.append(ChatMessageModel(user: Constants.username, content: sendingText))
        sendingText = ""
    }
    
    func didRecieveMessage(_ server: IRCServer, message: String) {
        logs.append(message)
    }
    
    func didRecieveMessage(_ channel: IRCChannel, message: String) {
        messageCount += 1
        if messageCount > Constants.maxMessages {
                messages.removeFirst()
        }
        messages.append(rawMessageToMessageModel(for: message))

    }
    
    
    func rawMessageToMessageModel(for rawMessage: String)-> ChatMessageModel{
        let splitted = rawMessage.split(separator: ":")
        return ChatMessageModel(user: String(splitted.first ?? ""), content: String(splitted.last ?? ""))
    }
}
