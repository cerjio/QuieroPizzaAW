//
//  TipoMasa.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit

class TipoMasa: NSObject {
    
    var descripcion : String = ""
    var valor : String = ""
    
    init(d : String, v : String) {
        descripcion = d
        valor = v
    }

}
