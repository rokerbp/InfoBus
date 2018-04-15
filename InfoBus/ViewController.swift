//
//  ViewController.swift
//  InfoBus
//
//  Created by roker on 4/13/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var origenField: UITextField!
    let origenes = ["Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    let destinos = ["CC Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    
    @IBOutlet weak var destinoField: UITextField!
    
    @IBOutlet weak var origenSelector: UIPickerView!
    
    @IBOutlet weak var destinoSelector: UIPickerView!
    
    //funciones
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = origenes.count
            if pickerView == destinoSelector {
                countrows = self.destinos.count
            }
            return countrows
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == origenSelector {
            let titleRow = origenes[row]
                return titleRow
        }
        else if pickerView == destinoSelector {
            let titleRow = destinos[row]
                return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == origenSelector {
            self.origenField.text = self.origenes[row]
            self.origenSelector.isHidden = true
        }
        
        else if pickerView == destinoSelector {
            self.destinoField.text = self.destinos[row]
            self.destinoSelector.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.origenField && self.destinoSelector.isHidden == true){
            self.origenSelector.isHidden = false
        }
        else if (textField == self.origenField && self.destinoSelector.isHidden == false){
            self.destinoSelector.isHidden = true
            self.origenSelector.isHidden = false
        }
        else if (textField == self.destinoField && self.origenSelector.isHidden == true){
            self.destinoSelector.isHidden = false
        }
        else if (textField == self.destinoField && self.origenSelector.isHidden == false){
            self.origenSelector.isHidden = true
            self.destinoSelector.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ponemos leyendas en los textInput origen y destino
        origenField.textAlignment = .center
        origenField.placeholder = "Seleccione su origenl"
        destinoField.textAlignment = .center
        destinoField.placeholder = "Seleccione su destino"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

