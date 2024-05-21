//
//  LogDIshWidgetLiveActivity.swift
//  LogDIshWidget
//
//  Created by Abdulaziz Jamaleddin on 5/21/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LogDIshWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LogDIshWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LogDIshWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LogDIshWidgetAttributes {
    fileprivate static var preview: LogDIshWidgetAttributes {
        LogDIshWidgetAttributes(name: "World")
    }
}

extension LogDIshWidgetAttributes.ContentState {
    fileprivate static var smiley: LogDIshWidgetAttributes.ContentState {
        LogDIshWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LogDIshWidgetAttributes.ContentState {
         LogDIshWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LogDIshWidgetAttributes.preview) {
   LogDIshWidgetLiveActivity()
} contentStates: {
    LogDIshWidgetAttributes.ContentState.smiley
    LogDIshWidgetAttributes.ContentState.starEyes
}
