//
//  Ruta.swift
//  InfoBus
//
//  Created by roker on 4/27/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

internal struct Key {
    static let empresa = "empresa"
    static let ruta = "ruta"
    static let tiempo = "tiempo"
    static let itinerario = "itinerario"
    static let horario = "horario"
}

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
        
        init(empresa:String, ruta:String, tiempo:Int? = nil, itinerario:String, horario:String, cover:UIImage? = nil){
        self.empresa = empresa
        self.ruta = ruta
        self.tiempo = tiempo ?? -1
        self.itinerario = itinerario
        self.horario = horario
        self.image = cover
    }
    
    init?(rs:FMResultSet) {
        let tiempo = rs.int(forColumn: Key.tiempo)
        guard let empresa = rs.string(forColumn: Key.empresa),
            let ruta = rs.string(forColumn: Key.ruta),
            let itinerario = rs.string(forColumn: Key.itinerario),
            let horario = rs.string(forColumn: Key.horario)
            else { return nil }
        self.init(empresa:empresa,
                  ruta:ruta,
                  tiempo:Int(tiempo),
                  itinerario:itinerario,
                  horario:horario
        )
    }
}
