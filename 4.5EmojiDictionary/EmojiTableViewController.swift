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
    
    var smileyAndPeopleData: [Emoji] = [
        Emoji(section: "Smiley&People", symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(section: "Smiley&People", symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(section: "Smiley&People", symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(section: "Smiley&People", symbol: "😆", name: "Chuckling Face", description: "An excited, mischieveous face.", usage: "joy"),
        Emoji(section: "Smiley&People", symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")
    ]
    
    var animalsAndNatureData: [Emoji] = [
        Emoji(section: "Animals&Nature", symbol: "🐇", name: "Rabbit", description: "A fluffy rabbit.", usage: "somthing fast"),
        Emoji(section: "Animals&Nature", symbol: "🐢", name: "Turtle", description: "A little turtle.", usage: "something slow"),
        Emoji(section: "Animals&Nature", symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(section: "Animals&Nature", symbol: "🐶", name: "Dog", description: "A cuddly dog.", usage: "something energetic"),
        Emoji(section: "Animals&Nature", symbol: "🐱", name: "Cat", description: "A cute cat.", usage: "something cute")
    ]
    
    var foodAndDrinkData: [Emoji] = [
        Emoji(section: "Food&Drink", symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti")
    ]
    
    var activityData: [Emoji] = [
        Emoji(section: "Activity", symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(section: "Activity", symbol: "📚", name: "Stack of Books",
              description: "Three colored books stacked on each other.",
              usage: "homework, studying")
    ]
    
    var travelAndPlacesData: [Emoji] = [Emoji(section: "Travel&Places", symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
    ]
    
    var objectData: [Emoji] = [
        Emoji(section:  "Objects", symbol: "📷", name: "Camera", description: "A black classic camera.", usage: "taking photos")
    ]
    
    var symbolData: [Emoji] = [
        Emoji(section: "Symbols", symbol: "💔", name: "Broken Heart",
              description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(section: "Symbols", symbol: "💤", name: "Snore",
              description: "Three blue \'z\'s.", usage: "tired, sleepiness")
    ]
    
    var flagData: [Emoji] = [
        Emoji(section: "Flags", symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage:"completion")
    ]
    
    lazy var emojis: [[Emoji]] = [smileyAndPeopleData, animalsAndNatureData, foodAndDrinkData, activityData, travelAndPlacesData, objectData, symbolData, flagData]
}

extension EmojiTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let navController = segue.destination as!
            UINavigationController
            let addEditEmojiTableViewController =
                navController.topViewController as! AddEditEmojiTableViewController
            
            let emoji = emojis[indexPath.section][indexPath.row]
            addEditEmojiTableViewController.emoji = emoji
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return emojis[section].count
        case 1:
            return emojis[section].count
        case 2:
            return emojis[section].count
        case 3:
            return emojis[section].count
        case 4:
            return emojis[section].count
        case 5:
            return emojis[section].count
        case 6:
            return emojis[section].count
        case 7:
            return emojis[section].count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        cell.update(with: emojis[indexPath.section][indexPath.row])
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return smileyAndPeopleData[0].section
        case 1:
            return animalsAndNatureData[0].section
        case 2:
            return foodAndDrinkData[0].section
        case 3:
            return activityData[0].section
        case 4:
            return travelAndPlacesData[0].section
        case 5:
            return objectData[0].section
        case 6:
            return symbolData[0].section
        case 7:
            return flagData[0].section
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

   
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as?
            AddEditEmojiTableViewController,
            let emoji = sourceViewController.emoji else { return }
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow
            {
                emojis[selectedIndexPath.section][selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath],
                with: .none)
            } else {
                let sectionText = emoji.section
                switch sectionText {
                case "Smiley&People":
                    let smileyIndex = IndexPath(row: 0, section: 0)
                    emojis[smileyIndex.section].append(emoji)
                    tableView.insertRows(at: [smileyIndex], with: .automatic)
                case "Animals&Nature":
                    let animalIndex = IndexPath(row: 0, section: 1)
                    emojis[animalIndex.section].append(emoji)
                    tableView.insertRows(at: [animalIndex], with: .automatic)
                case "Food&Drink":
                    let foodIndex = IndexPath(row: 0, section: 2)
                    emojis[foodIndex.section].append(emoji)
                    tableView.insertRows(at: [foodIndex], with: .automatic)
                case "Activity":
                    let activityIndex = IndexPath(row: 0, section: 3)
                    emojis[activityIndex.section].append(emoji)
                    tableView.insertRows(at: [activityIndex], with: .automatic)
                case "Travel&Places":
                    let travelIndex = IndexPath(row: 0, section: 4)
                    emojis[travelIndex.section].append(emoji)
                    tableView.insertRows(at: [travelIndex], with: .automatic)
                case "Objects":
                    let objectIndex = IndexPath(row: 0, section: 5)
                    emojis[objectIndex.section].append(emoji)
                    tableView.insertRows(at: [objectIndex], with: .automatic)
                case "Symbols":
                    let symbolIndex = IndexPath(row: 0, section: 6)
                    emojis[symbolIndex.section].append(emoji)
                    tableView.insertRows(at: [symbolIndex], with: .automatic)
                case "Flags":
                    let flagIndex = IndexPath(row: 0, section: 7)
                    emojis[flagIndex.section].append(emoji)
                    tableView.insertRows(at: [flagIndex], with: .automatic)
                default:
                    print("Out of range.")
                }
            }
    }
}

extension EmojiTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

