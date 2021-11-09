//
//  ContentView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-10-30.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State var message = ""
    @State var channelName = ""
    @State var isConnected = false
    var body: some View {
        VStack{
            HStack{
                if !isConnected{
                    TextField("Channel", text: $channelName)
                    if channelName.count > 2{
                        Button("connect to \(channelName)"){
                            chatViewModel.connect(to: channelName)
                            isConnected = true
                        }
                    }
                }
            }
            VStack {
                ChatView()
                    .environmentObject(chatViewModel)
            }
            SendMessageView()
                .environmentObject(chatViewModel)
        }
        .background(VisualEffectView(material: .hudWindow, blendingMode: .behindWindow))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
