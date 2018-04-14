//
//  ViewController.swift
//  InfoBus
//
//  Created by roker on 4/13/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        origenField.inputView = pickerView
        origenField.textAlignment = .center
        origenField.placeholder = "Seleccione su Origen"
        
    }

    @IBOutlet weak var origenField: UITextField!
    
    let origenes = ["Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    var pickerView = UIPickerView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return origenes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return origenes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        origenField.text = origenes[row]
        origenField.resignFirstResponder()
    }
}

