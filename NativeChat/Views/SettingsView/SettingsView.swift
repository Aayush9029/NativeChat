//
//  SettingsView.swift
//  NativeChat
//
//  Created by Aayush Pokharel on 2021-11-02.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel

    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(chatViewModel.username)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .lineLimit(1)
                    }
                    Spacer()
                }.padding(.vertical)
                VStack(spacing: 10) {
                    TextField("Your Twitch Access Token", text: $chatViewModel.oauthToken)

                    Link(
                        destination: URL(string: "https://twitchtokengenerator.com/quick/IQYvmJDcP3")!,
                        label: {
                            Label("Generate Access Token", systemImage: "network")
                                .padding(8)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                        }
                    )

                }.padding([.bottom])
                    .textFieldStyle(.roundedBorder)

            }

            Divider()
            VStack(alignment: .leading) {
                HStack {
                    Text("Logs")
                        .font(.title3.bold())
                        .padding(.top, 5)
                    Spacer()

                    NeatButton(title: "Copy", symbol: "paperclip")
                        .onTapGesture {
                            chatViewModel.copyLogsToClipboard()
                        }
                        .contextMenu {
                                Button("Copy Raw") {
                                    chatViewModel.copyLogsToClipboard(redacted: false)
                                }
                            Button("Copy Redacted") {
                                chatViewModel.copyLogsToClipboard(redacted: true)
                            }
                        }
                    NeatButton(title: chatViewModel.showingLogs ? "Hide" : "Show", symbol: chatViewModel.showingLogs ? "chevron.up" : "chevron.down")
                        .onTapGesture {
                            chatViewModel.showingLogs.toggle()
                        }
                }
                Spacer()
                Group {
                    if chatViewModel.showingLogs {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .leading) {

                                ForEach(chatViewModel.logs, id: \.self) {log in
                                    LogText(text: log, color: .gray)
                                }                                        .id(UUID())

                            }
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
