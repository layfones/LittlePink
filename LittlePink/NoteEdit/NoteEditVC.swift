//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by Layfones on 2022/5/4.
//
import YPImagePicker
import UIKit
import SKPhotoBrowser
import AVKit

class NoteEditVC: UIViewController {
    
    var photos = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!
    ]

    var videoURL: URL?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var titleCountLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var photoCount: Int {
        photos.count
    }
    
    var isVideo: Bool {
         videoURL != nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        // Do any additional setup after loading the view.
    }

    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEditChanged(_ sender: Any) {
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
}

extension NoteEditVC: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount {
            showTextHUD("标题最多输入\(kMaxNoteTitleCount)个字符")
            return false
        }
        return true
    }
}

