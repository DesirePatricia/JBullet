//
//  TodayEntryViewController.swift
//  JBullet
//
//  Created by Desire Guilarte on 2020/2/8.
//  Copyright © 2020 DesGui. All rights reserved.
//

import UIKit
import os.log

class TodayEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UITextFieldDelegate{
    
    
    //MARK: outlets
    @IBOutlet weak var entryType: UIPickerView!
    @IBOutlet weak var prioritySwitch: UISwitch!
    @IBOutlet weak var inspirationSwitch: UISwitch!
    @IBOutlet weak var entryText: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //MARK: variable
    var entryTypeData: [String] = [String]()
    var entry: Entry?
    
    
    //MARK: functions
    override func viewDidLoad() {
        super.viewDidLoad()
        //picker datasource
        self.entryType.delegate = self
        self.entryType.dataSource = self
        
        entryTypeData = ["task", "event", "note"]
        
        //Handle the text fields user input through delegate callbacks
        entryText.delegate = self
        
        //Enable the save button if the textfield has something valid in it
        updateSaveButtonState()
        
        
        //Notification observers this is added so I can move the text up when the keyboard shows up
        NotificationCenter.default.addObserver(self, selector: #selector(TodayEntryViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(TodayEntryViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        //if selects background will unselect
        let tapGestureBackground = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped(_:)))
        self.view.addGestureRecognizer(tapGestureBackground)
        
    }
    
    //Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return entryTypeData.count
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return entryTypeData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // once selected use this code
    }
    
    //Notification functions
    @objc func keyboardWillShow(notification: NSNotification){
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as?
            NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
    //background tapped deselect
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    //MARK: Navigation
    //This method lets you configure a view controller before its presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //configure the view state controller only when save has been pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let text = entryText.text ?? ""
        let type = entryTypeData[entryType.selectedRow(inComponent: 0)]
        let priority = prioritySwitch.isOn
        let inspiration = prioritySwitch.isOn
        
        entry = Entry(type: type, text: text, priority: priority, inspiration: inspiration)
    }
    
    //MARK: Actions
    @IBAction func cancelAddEntry(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        
    }
    
    /* Don't think this is necessary for my app
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the save button while editing
        saveButton.isEnabled = false
        
    }
    */
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        //Disable the save button if the text field is empty
        
        let text = entryText.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
    }
    

}
