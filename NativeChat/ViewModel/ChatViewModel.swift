//
//  ChatViewModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

class ChatViewModel: ObservableObject, IRCServerDelegate, IRCChannelDelegate {
    @Published var messages: [ChatMessageModel] = [ChatMessageModel]()
    @Published var currentStatus: ChatStatus = .none

    @Published var sendingText: String = ""

    var logs: [String] = [String]()
    @Published var showingLogs = false
    @AppStorage(AppStorageKeys.oauthToken.rawValue) var oauthToken = "oauth:YOUR_OAUTH_TOKEN"
    @AppStorage(AppStorageKeys.username.rawValue) var username = "aahyoushh"
    @AppStorage(AppStorageKeys.maxMessages.rawValue) var maxMessages = 40

    var messageCount: Int = 0

    let session = URLSession(configuration: .default)

    var user: UserModel
    var server: IRCServer
    var channel: IRCChannel?

    init() {
//        Default initializer
        user = UserModel.exampleUser
        server = IRCServer(
            hostname: "irc.chat.twitch.tv",
            port: 6667,
            user: UserModel(username: user.username, nick: user.username, password: user.password),
            session: session
        )

    }

    func connect(to channelName: String) {
        channel = nil
        messageCount = 0
        messages = []

        server = IRCServer(
            hostname: "irc.chat.twitch.tv",
            port: 6667,
            user: UserModel(username: username, nick: username, password: oauthToken),
            session: session
        )
        // Join the channel you want. This seems to be case-sensitive.
        channel = server.join(channelName)
        server.delegate = self
        channel?.delegate = self
    }

    func sendMessage() {
        // Send a message:
        channel?.send(sendingText)
        messages.append(ChatMessageModel(user: username, content: sendingText))
        sendingText = ""
    }

    func didRecieveMessage(_ server: IRCServer, message: String) {
        //        Messages sent by the server.
        logs.append(message)
    }

    func didRecieveMessage(_ channel: IRCChannel, message: String) {
        //        Messages sent by the users.
        messageCount += 1
        if messageCount > maxMessages {
                messages.removeFirst()
        }
        messages.append(rawMessageToMessageModel(for: message))

    }

    func addToLogs(response: String? = nil, hidestatus: Bool? = false) {
        if hidestatus != false {
            self.logs.append("\(Date()) | \(response ?? "")")
        } else {
            self.logs.append("\(Date()) | \(currentStatus.rawValue)")
            if response != nil {
                self.logs.append("response: \(response!)\n")
            }
        }

    }

    func copyLogsToClipboard(redacted: Bool = true) {
        var logsText = ""
        for log in self.logs {
            logsText += log
            logsText += "\n"
        }
        if redacted {
            logsText = logsText.replacingOccurrences(of: oauthToken, with: "********OAUTHTOKEN*****")
            logsText = logsText.replacingOccurrences(of: username, with: "*******USERNAME********")
        }

        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString(logsText, forType: .string)
    }

    func rawMessageToMessageModel(for rawMessage: String) -> ChatMessageModel {
        let splitted = rawMessage.split(separator: ":")
        return ChatMessageModel(user: String(splitted.first ?? ""), content: String(splitted.last ?? ""))
    }
}
