//
//  ContentView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var message = ""
    var body: some View {
        VStack{
            Button("connect to moistcr1tikal"){
                chatViewModel.connect(to: "moistcr1tikal")
            }
            VStack {
                ChatView()
                    .environmentObject(chatViewModel)
            }
            SendMessageView()
                .environmentObject(chatViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
