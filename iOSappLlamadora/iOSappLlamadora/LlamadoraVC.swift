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
    @IBOutlet weak var vwImg: UIImageView!

    var msg: String {
        txtMsg.text?.trimmingCharacters(in: .whitespaces) ?? "Void"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMsg.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
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
    
    @IBAction func onBtnEnviarImgPorAirDrop() {
        guard let img = vwImg.image else {
            return
        }
        let activityVC = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
     
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
