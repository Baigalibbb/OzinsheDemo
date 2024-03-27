//
//  ProfileViewController.swift
//  OzinsheDemo
//
//  Created by Tenizbayev Bolat on 21.03.2024.
//

import UIKit
import Localize_Swift

class ProfileViewController: UIViewController, LanguageProtocol {
    @IBOutlet weak var myProfileLabel: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViews()
    }
    
    func configureViews() {
        myProfileLabel.text = "MY_PROFILE".localized()
        languageButton.setTitle("LANGUAGE".localized(), for: .normal)

        if Localize.currentLanguage() == "ru"{
            languageLabel.text = "Русский"
        }
        if Localize.currentLanguage() == "kk"{
            languageLabel.text = "Қазақша"
        }
        if Localize.currentLanguage() == "en"{
            languageLabel.text = "English"
        }
    }
    
    @IBAction func languageShow(_ sender: Any) {
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "languageViewController") as! LanguageViewController
        
        languageVC.modalPresentationStyle = .overFullScreen
        
        languageVC.delegate = self
        
        present(languageVC, animated: true, completion: nil)
    }
    
    func languageDidChange() {
        configureViews()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
