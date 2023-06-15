//
//  ContentView.swift
//  EmojiLover
//
//  Created by Aaron Sim on 2023-06-15.
//

import SwiftUI

// Enum = enumuration, title = emoji, type value string, caseiterable is protocol helps loops over the string
enum Emoji: String, CaseIterable {
    case 🇨🇦, 🇺🇸, 🇪🇸, 🇳🇵
}

// Extended to view
struct ContentView: View {
    // Selection is special type of data which is marked as state
    // State helps update
    @State var selection: Emoji = .🇺🇸
    
    // Body here for view
    var body: some View {
        
        // Outer navigation view which has a title of Emoji lovers
        NavigationView {
            // Vertical stack container
            VStack {
                // Two elements in containers
                // First = label (text) - shows current selection which is raw value giving string variale from emojis
                // Second = Font to make emoji look larger
                Text(selection.rawValue)
                    .font(.system(size: 150))
                
                // Picker with a title  with state binding
                // Looping over cases for all emoji with id = self
                Picker("Select Emoji", selection: $selection){
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                // You can change the picker stype as you wish
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Lovers!")
            // Give padding for the picker
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
