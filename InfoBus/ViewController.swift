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
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        destinoField.inputView = pickerView2
        destinoField.textAlignment = .center
        destinoField.placeholder = "Seleccione su Destino"
        
    }

    @IBOutlet weak var origenField: UITextField!
    @IBOutlet weak var destinoField: UITextField!
    
    let origenes = ["Campanario", "Terraplaza", "Parque de la salud", "La estancia", "El Uvo", "Lomas de granada"]
    var pickerView = UIPickerView()
    var pickerView2 = UIPickerView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //construir el picker para origen
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
    
    //construir el picker para el destino
    public func numberOfComponents2(in pickerView2: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView2(_ pickerView2: UIPickerView, numberOfRowsInComponent component2: Int) -> Int{
        return origenes.count
    }
    
    func pickerView2(_ pickerView2: UIPickerView, titleForRow row: Int, forComponent component2: Int) -> String? {
        return origenes[row]
    }
    
    func pickerView2(_ pickerView2: UIPickerView, didSelectRow row: Int, inComponent component2: Int) {
        destinoField.text = origenes[row]
        destinoField.resignFirstResponder()
    }
    
    
}

