//
//  SendMessageView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import SwiftUI

struct SendMessageView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State var isButtonHovered: Bool = false
    var body: some View {
        HStack{
            TextField("Send a message", text: $chatViewModel.sendingText)
                .padding(5)
                .font(.title2)
                .textFieldStyle(.plain)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2)
                )
                
            Label("Send", systemImage: "arrow.up.circle.fill")
                .font(.title3.bold())
                .foregroundColor(isButtonHovered ? .green : .gray)
                .padding(5)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(isButtonHovered ? .green : .gray, lineWidth: 2)
                )
                .onHover(perform: { newVal in
                    withAnimation {
                        isButtonHovered = newVal
                    }
                })
                .onTapGesture {
                    chatViewModel.sendMessage()
                }
        }
        .padding()
    }
}

struct SendMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageView()
            .environmentObject(ChatViewModel())
    }
}
