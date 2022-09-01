//
//  AddGarmentViewController.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

class AddGarmentViewController: UIViewController, AddGarmentDisplaying {
    
    var presenter: AddGarmentPresenting?
    @IBOutlet weak var nameTaxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    func dismissKeyboard() {
        nameTaxtField.resignFirstResponder()
    }
    
    @IBAction func saveGarment(_ sender: Any) {
        presenter?.addGarment(name: nameTaxtField.text)
    }
}
