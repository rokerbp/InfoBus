//
//  Ruta.swift
//  InfoBus
//
//  Created by roker on 4/27/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit
struct Ruta {
    static let defaultCover = UIImage(named: "ruta.png")!
    var empresa: String
    var ruta: String
    var tiempo: Int
    var itinerario: String
    var horario: String
    var cover:UIImage {
        get {
            return image ?? Ruta.defaultCover
            }
        set {
            image = newValue
            }
        }
        private var image:UIImage? = nil
        
        init(empresa:String, ruta:String, tiempo:Int, itinerario:String, horario:String, cover:UIImage? = nil){
        self.empresa = empresa
        self.ruta = ruta
        self.tiempo = tiempo
        self.itinerario = itinerario
        self.horario = horario
        self.image = cover
    }
}
