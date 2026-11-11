# NativeChat

NativeChat is a native macOS Twitch chat client with accessibility features. It uses SwiftUI and AppKit, and it has no third-party dependencies. Status: open source, work in progress, low activity.

## Commands

| Task | Command |
|------|---------|
| Build | `xcodebuild -project NativeChat.xcodeproj -scheme NativeChat build` |

There is no test target.

## Architecture

| Part | Role |
|------|------|
| `NativeChat/IRCServer/` | A small IRC client on `URLSessionStreamTask`: `IRCServer` sends `PASS`/`USER`/`NICK` and parses lines; `IRCChannel` joins channels |
| `NativeChat/ViewModel/ChatViewModel.swift` | Connects to `irc.chat.twitch.tv:6667` with the user's OAuth token, and owns the chat state |
| `NativeChat/ Model/` | Models and `AppStorageKeys` (the folder name starts with a space) |
| `NativeChat/Views/` | Chat list, message field, and settings |

- Bundle ID: `com.aayushpokharel.opensource.NativeChat`. Deployment target: macOS 12.
- Related app: `../NativeTwitch` is the Twitch stream browser.

## Rules

- This repository is public. Do not commit an OAuth token. The token lives in `@AppStorage` under the key `User Oauth Key`.
- Keep the token mask in the log view (`ChatViewModel`) when you change the logging.
- Use `os.Logger`, not `print`.
- Quote the ` Model` folder path, because the leading space breaks unquoted shell paths.
