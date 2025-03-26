//
//  AddJournalEntryViewController.swift
//  JRNL
//
//  Created by 존진 on 3/26/25.
//

import UIKit

class AddJournalEntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var newJournalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        let title = titleTextField.text ?? ""
        let body = bodyTextView.text ?? ""
        let photo = photoImageView.image
        let rating = 3
        newJournalEntry = JournalEntry(rating: rating, title: title, body: body, photo: photo)
    }

}
