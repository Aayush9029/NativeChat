//
//  ChatRowView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import SwiftUI

struct ChatRowView: View {
    let chat: ChatMessageModel
    var body: some View {
        HStack(alignment: .top){
            Text(chat.user)
                .font(.title3)
                .bold()
                .foregroundColor(Color(nsColor: ChatMessageModel.nameColor(username: chat.user)))
                .foregroundColor(.secondary)
            Text(chat.content)
                .font(.title3)
            Spacer()
        }
    }
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        List{
        ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog"))
            ChatRowView(chat: ChatMessageModel(user: "justinradio", content: "Hello, poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog poggers i am new to chat pog"))

        }
    }
}
