//
//  EmojiTableViewController.swift
//  4.5EmojiDictionary
//
//  Created by Sophie Kim on 2020/09/08.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var emojis: [[Emoji]] = [
        [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "😆", name: "Chuckling Face", description: "An excited, mischieveous face.", usage: "joy"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")
        ],
                           
        [Emoji(symbol: "🐇", name: "Rabbit", description: "A fluffy rabbit.", usage: "somthing fast"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A little turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🐶", name: "Dog", description: "A cuddly dog.", usage: "something energetic"),
        Emoji(symbol: "🐱", name: "Cat", description: "A cute cat.", usage: "something cute")
        ],
        
        [Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        ],
    
        [Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "📚", name: "Stack of Books",
           description: "Three colored books stacked on each other.",
           usage: "homework, studying")
        ],
        
        [Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
        ],
    
        [Emoji(symbol: "📷", name: "Camera", description: "A black classic camera.", usage: "taking photos")
        ],
        
        [Emoji(symbol: "💔", name: "Broken Heart",
           description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore",
           description: "Three blue \'z\'s.", usage: "tired, sleepiness")
        ],
        
        [Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage:"completion")
        ]
    ]
}

extension EmojiTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return emojis[0].count
        case 1:
            return emojis[1].count
        case 2:
            return emojis[2].count
        case 3:
            return emojis[3].count
        case 4:
            return emojis[4].count
        case 5:
            return emojis[5].count
        case 6:
            return emojis[6].count
        case 7:
            return emojis[7].count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojis[indexPath.section][indexPath.row]
        cell.update(with: emoji)
        cell.showsReorderControl = true
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.section]
        print("\(emoji[indexPath.row].symbol) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Smiley&People"
        case 1:
            return "Animals&Nature"
        case 2:
            return "Food&Drink"
        case 3:
            return "Activity"
        case 4:
            return "Travel&Places"
        case 5:
            return "Objects"
        case 6:
            return "Symbols"
        case 7:
            return "Flags"
        default:
            return ""
        }
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        emojis[destinationIndexPath.section].insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .automatic)
        }
    }
    
}

extension EmojiTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
          return .delete
      }
}
