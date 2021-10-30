//
//  FakeLoginView.swift
//  B-Spoke
//
//  Created by katagaki on 2019/11/13.
//  Copyright © 2019 B-Spoke. All rights reserved.
//

import UIKit

class FakeLoginView: UITableViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func inputPlaceholders(_ sender: Any) {
        emailTxt.text = "katagaki.naomi@alltale.ac.jp"
        passwordTxt.text = "何度失ったって取り返してみせるよ"
        emailTxt.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MakeOrderView.authenticationCompletionHandler(loginStatusNotification:)), name: .MTBiometricAuthenticationNotificationLoginStatus, object: nil)
    }
    
    @objc func authenticationCompletionHandler(loginStatusNotification: Notification) {
        if let _ = loginStatusNotification.object as? MTBiometricAuthentication, let userInfo = loginStatusNotification.userInfo {
            if let authStatus = userInfo[MTBiometricAuthentication.status] as? MTBiomericAuthenticationStatus {
                if authStatus.success {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "signInWithApple", sender: self)
                    }
                }
            } else {
                DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Could Not Sign In", message: "Could not sign you in at the moment. Please try again later.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {_ in self.dismiss(animated: true, completion: nil)}))
                        self.present(alert, animated: true)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 1 {
            let bioAuth = MTBiometricAuthentication()
            bioAuth.reasonString = "To sign in."
            bioAuth.authenticationWithBiometricID()
        }
    }
    
    
}
