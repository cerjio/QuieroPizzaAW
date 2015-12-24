//
//  TipoQuesoInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class TipoQuesoInterfaceController: WKInterfaceController {
    
    @IBOutlet var tipoQueso: WKInterfacePicker!
    
    var listaTipoQueso: [(String, String)] = [
        ("Mozarela", "M"),
        ("Cheddar", "C"),
        ("Parmesano", "P"),
        ("Sin queso", "S")
    ]
    
    var tamaño : String? = nil
    var tipoMasa : String? = nil

    var tipoQuesoSeleccionado : (String, String)? = nil


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! TipoMasa
        tamaño = c.tamaño
        tipoMasa = c.descripcion
        
        let pickerItems :[WKPickerItem] = listaTipoQueso.map{
            let pickerItem = WKPickerItem()
            
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            
            return pickerItem
        }
        tipoQueso.setItems(pickerItems)
        tipoQueso.setSelectedItemIndex(0)
        tipoQuesoSeleccionado = listaTipoQueso[0]

        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
         tipoQuesoSeleccionado = listaTipoQueso[value]
    }
    
    @IBAction func seleccionarIngredientes() {
        var valorContexto : AnyObject? = nil
        if(tipoQuesoSeleccionado != nil) {
            
            valorContexto = TipoQueso(d: tipoQuesoSeleccionado!.0, v: tipoQuesoSeleccionado!.1, t: tamaño!, tm: tipoMasa!)
        }

        pushControllerWithName("Ingredientes", context: valorContexto)
    }

}
