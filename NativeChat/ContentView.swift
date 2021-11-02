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
        VStack{
            Button("connect to moistcr1tikal"){
                chatViewModel.connect(to: "moistcr1tikal")
            }
            VStack {
                ChatView()
                    .environmentObject(chatViewModel)
            }
//            HStack{
//                TextField("Send a message", text: $chatViewModel.text)
//                    .font(Font.system(size: 15, weight: .medium, design: .rounded))
//                      .textFieldStyle(RoundedBorderTextFieldStyle())
//                      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
//                
//                Label("Send", systemImage: "arrow.up")
//                    padding(10)
//                    .background(.ultraThickMaterial)
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
