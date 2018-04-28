//
//  RutaViewController.swift
//  InfoBus
//
//  Created by roker on 4/27/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

class RutaViewController: UIViewController {
    var delegate: RutaViewControllerDelegate?
    
    @IBOutlet weak var rutaMap: UIImageView!
    @IBOutlet weak var empresaTxtField: UITextField!
    @IBOutlet weak var rutaTxtField: UITextField!
    @IBOutlet weak var tiempoTxtField: UITextField!
    @IBOutlet weak var itinerarioTxtField: UITextField!
    
    var ruta: Ruta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ruta = ruta {
            rutaMap.image = ruta.cover
            empresaTxtField.text = ruta.empresa
            rutaTxtField.text = ruta.ruta
            tiempoTxtField.text = String(ruta.tiempo)
            itinerarioTxtField.text = ruta.itinerario
            navigationItem.title = "Ruta Seleccionada"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
protocol RutaViewControllerDelegate {
    func saveBook(_ ruta: Ruta)
}
