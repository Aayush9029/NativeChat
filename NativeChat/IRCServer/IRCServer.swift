//
//  IRCServer.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Foundation

public class IRCServer {
    public var delegate: IRCServerDelegate? {
        didSet {
            guard let delegate = delegate else {
                return
            }
            
            buffer.forEach { (line) in
                delegate.didRecieveMessage(self, message: line)
            }
            buffer = []
        }
    }
    
    private var buffer = [String]()
    private var session: URLSession
    private var task: URLSessionStreamTask!
    private var channels = [IRCChannel]()
    
    public required init(hostname: String, port: Int, user: UserModel, session: URLSession) {
        self.session = session
        
        task = session.streamTask(withHostName: hostname, port: port)
        task.resume()
        read()
        
        send("PASS \(user.password)")
        send("USER \(user.username)")
        send("NICK \(user.nick)")
    }
    
    public class func connect(_ hostname: String, port: Int, user: UserModel, session: URLSession = URLSession.shared) -> Self {
        return self.init(hostname: hostname, port: port, user: user, session: session)
    }
    
    private func read() {
        task.readData(ofMinLength: 0, maxLength: 9999, timeout: 0) { (data, atEOF, error) in
            guard let data = data, let message = String(data: data, encoding: .utf8) else {
                return
            }
            
            for line in message.split(separator: "\r\n") {
                self.processLine(String(line))
            }
            
            self.read()
        }
    }
    
    private func processLine(_ message: String) {
        let input = IRCInputParser.parseServerMessage(message)
        switch input {
        case .serverMessage(_, let message):
            if let delegate = self.delegate {
                delegate.didRecieveMessage(self, message: message)
            } else {
                self.buffer.append(message)
            }
        case .joinMessage(let user, let channelName):
            self.channels.forEach({ (channel) in
                if channel.name == channelName {
                    channel.receive("\(user) joined \(channelName)")
                }
            })
        case .channelMessage(let channelName, let user, let message):
            self.channels.forEach({ (channel) in
                if channel.name == channelName {
                    channel.receive("\(user): \(message)")
                }
            })
        case .userList(let channelName, let users):
            self.channels.forEach({ (channel) in
                if channel.name == channelName {
                    users.forEach({ (user) in
                        channel.receive("\(user) joined")
                    })
                }
            })
        default:
            print("Unknown: \(message)")
        }
    }
    
    public func send(_ message: String) {
        task.write((message + "\r\n").data(using: .utf8)!, timeout: 0) { (error) in
            if let error = error {
                print("Failed to send: \(String(describing: error))")
            } else {
                print("Sent!")
            }
        }
    }
    
    public func join(_ channelName: String) -> IRCChannel {
        send("JOIN #\(channelName)")
        let channel = IRCChannel(name: channelName, server: self)
        channels.append(channel)
        return channel
    }
}

public protocol IRCServerDelegate {
    func didRecieveMessage(_ server: IRCServer, message: String)
}


public protocol IRCChannelDelegate {
    func didRecieveMessage(_ channel: IRCChannel, message: String)
}
