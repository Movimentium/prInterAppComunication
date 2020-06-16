//
//  LlamadoraVC.swift
//  iOSappLlamadora
//
//  Created by Miguel on 16/06/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class LlamadoraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnAbrirLaOtraApp() {
        guard let appLlamadaURL = URL(string: "iOSappLlamada://"),
            UIApplication.shared.canOpenURL(appLlamadaURL)
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
     
}
