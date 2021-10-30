//
//  ChatModel.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import Foundation


struct ChatModel: Identifiable{
    let id: UUID
    let userName: String
    let message: String
}
