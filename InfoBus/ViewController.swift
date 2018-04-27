//
//  ViewController.swift
//  InfoBus
//
//  Created by roker on 4/13/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    let origenes = ["Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    let destinos = ["CC Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    
    @IBOutlet weak var origenField: UITextField!
    
    @IBOutlet weak var destinoField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ponemos leyendas en los textInput origen y destino
        origenField.textAlignment = .center
        origenField.placeholder = "Seleccione su origen"
        destinoField.textAlignment = .center
        destinoField.placeholder = "Seleccione su destino"
        
        //Definimos un picker view para origenes, lo delegamos a el mismo y lo asignamos al TxtField origenes
        let OrigenPickerView = UIPickerView()
        OrigenPickerView.delegate = self
        OrigenPickerView.tag = 1
        origenField.inputView = OrigenPickerView
        
        //Definimos un picker view para origenes, lo delegamos a el mismo y lo asignamos al TxtField origenes
        let DestinoPickerView = UIPickerView()
        DestinoPickerView.delegate = self
        DestinoPickerView.tag = 2
        destinoField.inputView = DestinoPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 1 {
            return origenes.count
        }
        
        if pickerView.tag == 2 {
            return destinos.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return origenes[row]
        }
        if pickerView.tag == 2 {
            return destinos[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            origenField.text = origenes[row]
        }
        if pickerView.tag == 2{
            destinoField.text = destinos[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

