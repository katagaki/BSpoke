//
//  MakeOrderViewTentative.swift
//  B-Spoke
//
//  Created by katagaki on 2019/11/14.
//  Copyright © 2019 B-Spoke. All rights reserved.
//

import UIKit

class MakeOrderViewTentative:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MakeOrderView.authenticationCompletionHandler(loginStatusNotification:)), name: .MTBiometricAuthenticationNotificationLoginStatus, object: nil)
    }
    
    @objc func authenticationCompletionHandler(loginStatusNotification: Notification) {
        if let _ = loginStatusNotification.object as? MTBiometricAuthentication, let userInfo = loginStatusNotification.userInfo {
            if let authStatus = userInfo[MTBiometricAuthentication.status] as? MTBiomericAuthenticationStatus {
                if authStatus.success {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Order Placed", message: "Your order has been placed successfully. A invoice will be sent to your email after manufacturability of your product has been determined.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: {_ in self.dismiss(animated: true, completion: nil)}))
                        self.present(alert, animated: true)
                    }
                }
            } else {
                DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Order Not Placed", message: "Your order could not be placed, please try again.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {_ in self.dismiss(animated: true, completion: nil)}))
                        self.present(alert, animated: true)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section >= 5 {
            let bioAuth = MTBiometricAuthentication()
            bioAuth.reasonString = "To make purchases."
            bioAuth.authenticationWithBiometricID()
        }
    }
    
}
