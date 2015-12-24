//
//  InterfaceController.swift
//  QuieroPizzaAW WatchKit Extension
//
//  Created by cerjio on 23/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tamaño: WKInterfacePicker!
    
    var listaTamaño: [(String, String)] = [
        ("Chica", "C"),
        ("Mediana", "M"),
        ("Grande", "G")
    ]
    
    var tamañoSeleccionado : (String, String)? = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems :[WKPickerItem] = listaTamaño.map{
            let pickerItem = WKPickerItem()
            
            pickerItem.title = $0.0
            pickerItem.caption = $0.1

            return pickerItem
        }
        tamaño.setItems(pickerItems)
        tamaño.setSelectedItemIndex(0)
        tamañoSeleccionado = listaTamaño[0]
       
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerSelectedItemChanged(value: Int) {
        
        tamañoSeleccionado = listaTamaño[value]
    }
    
    @IBAction func seleccionarTipoMasa() {
        var valorContexto : AnyObject? = nil
        if(tamañoSeleccionado != nil) {
            
            valorContexto = Taman_o(d: tamañoSeleccionado!.0, v: tamañoSeleccionado!.1)
        }
        pushControllerWithName("TipoMasa", context: valorContexto)
        
    }
    
}
