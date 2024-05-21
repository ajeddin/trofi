//
//  LogDishWidget.swift
//  LogDishWidget
//
//  Created by Mohamed Midani on 5/17/24.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct LogDishWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack{
            
            
            VStack {
                Text("trofi")
                    .font(.title.weight(.bold))
                    .foregroundColor(Color.white)
                
                
                
                Button(intent: LogDishIntent()){
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding(10)
                        .background(Color.white)
                        .foregroundColor(Color("trofiPink"))
                        .clipShape(Circle())
                        .shadow(color: .clear, radius: 0, x: 0, y: 0) // Remove any shadow
                    
                }
                
                .buttonStyle(PlainButtonStyle())
                
                
                Text("log a dish")
                    .foregroundColor(Color.white)
                
            }
            
        }
    }
}

struct LogDishWidget: Widget {
    let kind: String = "LogDishWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            LogDishWidgetEntryView(entry: entry)
                .containerBackground(for: .widget) { Color("trofiPink") }
        }
        .configurationDisplayName("Log Dish Widget")
        .description("This is a widget to log your dishes.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    LogDishWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
