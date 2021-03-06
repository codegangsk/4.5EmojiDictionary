//
//  Emoji.swift
//  4.5EmojiDictionary
//
//  Created by Sophie Kim on 2020/09/08.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import Foundation

struct Emoji {
    var section: String
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(section: String, symbol: String, name: String, description: String, usage: String) {
        self.section = section
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
