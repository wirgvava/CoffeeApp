//
//  ProfileViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - View Life Cycle
   override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupProfile()
    }
    
    // MARK: - Actions
    @IBAction func didTappedLogoutBtn(_ sender: Any){
        logOut()
    }
    
    // MARK: - Methods
    private func logOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }

        UserDefaults.standard.set(false, forKey: "userIsLoggedIn")
        PresenterManager.shared.navigate(to: .onboardingViewController)
    }
    
    
    // TODO: - Fix that!!!
    private func setupProfile(){
        guard let user = Auth.auth().currentUser else { return }
        let uid = user.uid
        let db = Firestore.firestore()
        let ref = db.collection("user").whereField("uid", isEqualTo: uid)

        emailLabel.text = user.email ?? ""
        
        ref.getDocuments { result, error in
            
            let userDoc = result?.documents
            
            if let userDoc = userDoc {
                for document in userDoc {
                    let data = document.data()
                    let name = data["firstName"]!
                    let lastname = data["lastName"]!
                    self.nameLastnameLabel.text = "\(name) \(lastname)"
                }
            }
            
            
        }
    }
 
}

