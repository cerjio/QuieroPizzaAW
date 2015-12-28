//
//  Orden.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 28/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit

class Orden: NSObject {
    
    var tamaño : Taman_o? = nil
    var masa : TipoMasa? = nil
    var queso: TipoQueso? = nil
    var ingredientes : Ingredientes? = nil
    var nombreControlador : String = ""
    
    init(tamaño: Taman_o?, masa: TipoMasa?, queso: TipoQueso?, ingredientes: Ingredientes?, nombreControlador: String) {
        
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
        self.nombreControlador = nombreControlador
        
    }

}
