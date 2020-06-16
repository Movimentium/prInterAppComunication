//
//  LlamadaVC.swift
//  iOSappLlamada
//
//  Created by Miguel on 16/06/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class LlamadaVC: UIViewController {

    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notifNewMsg = Notification.Name(K.notifNewMsg)
        NotificationCenter.default.addObserver(forName: notifNewMsg, object: nil, queue: OperationQueue.main) { (notif) in
            if let strMsg = notif.object as? String {
                self.lblMsg.text = strMsg
            }
        }
        
    }
    

   
}
