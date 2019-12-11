//
//  ViewController.swift
//  UiTextField&&Notifications
//
//  Created by max on 11.12.2019.
//  Copyright © 2019 MaxT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var firstTextField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createFirstTextField()
        firstTextField.delegate = self  //подписываемся на делегат
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = -200
            }    /*добавляем наблюдателя в нотификэйшн
                 для изменения отсчета вью при открытии клавиатуры*/
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = 0.0
        }    /*добавляем наблюдателя в нотификэйшн
             для изменения отсчета вью при скрытии клавиатуры*/

        
    }
    
    //MARK: Methode
    func createFirstTextField() {
        let locationTextField = CGRect(x: 0, y: 0, width: 200, height: 31)
        firstTextField = UITextField(frame: locationTextField)
        firstTextField.center = view.center
        firstTextField.contentHorizontalAlignment = .center
        firstTextField.contentVerticalAlignment = .center
        firstTextField.textAlignment = .center
        firstTextField.placeholder = "Enter your pass"
        firstTextField.borderStyle = .roundedRect
        view.addSubview(firstTextField)
    }    //метод создания textField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstTextField.resignFirstResponder()
        return true
    }    //метод скрытия клавиатуры при нажатии на return
    
    //MARK: Delegate
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("введено \(string)")
        return true
    }    //метод делегата для отслеживания введеных символов в textField
    


}

