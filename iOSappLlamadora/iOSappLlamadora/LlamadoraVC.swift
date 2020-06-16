//
//  LlamadoraVC.swift
//  iOSappLlamadora
//
//  Created by Miguel on 16/06/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class LlamadoraVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMsg: UITextField!
    
    var msg: String {
        txtMsg.text?.trimmingCharacters(in: .whitespaces) ?? "Void"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMsg.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnAbrirLaOtraApp() {
        guard let appLlamadaURL = URL(string: "iOSappLlamada://?message=\(msg)") /*,
            UIApplication.shared.canOpenURL(appLlamadaURL)*/
            else {
            print("No se ha podido abrir")
            return
        }
        UIApplication.shared.open(appLlamadaURL, options: [:]) { (success) in
            if success == false {
                print("Se ha intendado abrir pero no se ha podido")
            }
        }
    }
     
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
