//
//  AddEditEmojiTableViewController.swift
//  4.5EmojiDictionary
//
//  Created by Sophie Kim on 2020/09/14.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    var emoji: Emoji?

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
}

extension AddEditEmojiTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
    }
}
