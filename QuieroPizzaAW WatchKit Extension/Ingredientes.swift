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
   
    
    init(ingreSel : [String], v : [String]) {
        ingredientesSeleccionados = ingreSel
        valor = v
    }

}
