//
//  LanguageViewController.swift
//  OzinsheDemo
//
//  Created by Tenizbayev Bolat on 21.03.2024.
//

import UIKit
import Localize_Swift

protocol LanguageProtocol{
    func languageDidChange()
}

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var thing: UIView!
    
    var delegate : LanguageProtocol?
    
    let languageArray = [["English", "en"], ["Қазақша", "kk"], ["Русский", "ru"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        backgroundView.layer.cornerRadius = 32
        backgroundView.clipsToBounds = true
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        thing.layer.cornerRadius = 5
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backgroundView))!{
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = languageArray[indexPath.row][0]
        
        let checkImage = cell.viewWithTag(1001) as! UIImageView
        
        if Localize.currentLanguage() == languageArray[indexPath.row][1]{
            checkImage.image = UIImage(named: "Check")
        }
        else {
            checkImage.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languageArray[indexPath.row][1])
        delegate?.languageDidChange()
        dismiss(animated: true, completion: nil)
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
