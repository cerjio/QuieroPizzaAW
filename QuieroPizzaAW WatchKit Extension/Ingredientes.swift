//
//  Ingredientes.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit

class Ingredientes: NSObject {

    
    var ingredientesSeleccionados : [String] = []
    var valor : [String] = []
    var tamaño : String? = nil
    var tipoMasa : String? = nil
    var tipoQueso : String? = nil
    
    init(ingreSel : [String], v : [String], t: String, tm: String, tq: String) {
        ingredientesSeleccionados = ingreSel
        valor = v
        tamaño = t
        tipoMasa = tm
        tipoQueso = tq
    }

}
