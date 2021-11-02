//
//  IRCChannel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Foundation

public class IRCChannel {
    public var delegate: IRCChannelDelegate? = nil {
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
    public let name: String
    public let server: IRCServer
    private var buffer = [String]()
    
    public init(name: String, server: IRCServer) {
        self.name = name
        self.server = server
    }
    
    
    func receive(_ text: String) {
        if let delegate = self.delegate {
            DispatchQueue.main.sync {
                delegate.didRecieveMessage(self, message: text)
            }
        } else {
            buffer.append(text)
        }
    }
    
    public func send(_ text: String) {
        server.send("PRIVMSG #\(name) :\(text)")
    }
}

