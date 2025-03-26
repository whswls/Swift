//
//  AddJournalEntryViewController.swift
//  JRNL
//
//  Created by 존진 on 3/26/25.
//

import UIKit

class AddJournalEntryViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var newJournalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    스토리보드 내에서 delegate를 설정해줬기 때문에 아래 코드는 필요없다.
        //    titleTextField.delegate = self
        //    bodyTextView.delegate = self
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare: \(String(describing: segue.identifier))")
        if let segueIndentifier = segue.identifier {
            if segueIndentifier == "save" {
                let title = titleTextField.text ?? ""
                let body = bodyTextView.text ?? ""
                let photo = photoImageView.image
                let rating = 3
                newJournalEntry = JournalEntry(rating: rating, title: title, body: body, photo: photo)
            }
        }
    }
    
    // MARK: - Methods
    func updateSaveButtonState() {
        let titleText = titleTextField.text ?? ""
        let bodyText = bodyTextView.text ?? ""
        saveButton.isEnabled = !titleText.isEmpty && !bodyText.isEmpty
    }
}

// MARK: - UITextFieldDelegate
extension AddJournalEntryViewController: UITextFieldDelegate {
    // 텍스트 필드가 편집을 시작할 때 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
}

// MARK: - UITextViewDelegate
extension AddJournalEntryViewController: UITextViewDelegate {
    // 텍스트 뷰가 편집을 시작할 때 호출
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveButton.isEnabled = false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("shouldChangeTextIn: \(text)")
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        updateSaveButtonState()
    }
}
