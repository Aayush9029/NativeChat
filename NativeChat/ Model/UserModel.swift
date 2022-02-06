//
//  UserModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import Foundation

public struct UserModel {
    public let username: String
    public let nick: String
    public let password: String

    static let exampleUser = UserModel(username: "", nick: "", password: "")
}
