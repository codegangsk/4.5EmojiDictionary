//
//  EmojiTableViewController.swift
//  4.5EmojiDictionary
//
//  Created by Sophie Kim on 2020/09/08.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "😆", name: "Chuckling Face", description: "An excited, mischieveous face", usage: "joy"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐇", name: "Rabbit", description: "A fluffy rabbit.", usage: "somthing fast"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A little turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🐶", name: "Dog", description: "A cuddly dog.", usage: "something energetic"),
        Emoji(symbol: "🐱", name: "Cat", description: "A cute cat.", usage: "something cute"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books",
           description: "Three colored books stacked on each other.",
           usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart",
           description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore",
           description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage:"completion")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
}
