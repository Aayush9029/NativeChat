//
//  ChatView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(chatViewModel.messages, id: \.self) { chat in
                    ChatRowView(chat: chat)
                }
            }
        }
        .padding()
    }
}
