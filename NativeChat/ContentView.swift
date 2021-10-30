//
//  ContentView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var chatViewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            HStack{
            Text("HELLO")
                Spacer()
            }
            Button("connect to ryan"){
                chatViewModel.connect(to: "itsRyanHiga")
                chatViewModel.chats.append(ChatModel(id: UUID(), userName: "aahtest", message: "POGGERs"))
            }
            ScrollView {
                ForEach(chatViewModel.chats){ chat in
                    Text(chat.message)
                }
            }
            .onChange(of: chatViewModel.currentStatus) { newValue in
                print(newValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
