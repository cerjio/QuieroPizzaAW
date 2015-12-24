//
//  TipoMasaInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class TipoMasaInterfaceController: WKInterfaceController {
    
    @IBOutlet var tipoMasa: WKInterfacePicker!
    
    var tamaño : String? = nil
    
    var listaTipoMasa: [(String, String)] = [
        ("Delgada", "D"),
        ("Crujiente", "C"),
        ("Gruesa", "G")
    ]
    
    var tipoMasaSeleccionada : (String, String)? = nil

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Taman_o
        
        tamaño = c.descripcion
        
        let pickerItems :[WKPickerItem] = listaTipoMasa.map{
            let pickerItem = WKPickerItem()
            
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            
            return pickerItem
        }
        tipoMasa.setItems(pickerItems)
        tipoMasa.setSelectedItemIndex(0)
        tipoMasaSeleccionada = listaTipoMasa[0]
        
        
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
         tipoMasaSeleccionada = listaTipoMasa[value]
    }
    @IBAction func seleccionarTipoQueso() {
        var valorContexto : AnyObject? = nil
        if(tipoMasaSeleccionada != nil) {
            
            valorContexto = TipoMasa(d: tipoMasaSeleccionada!.0, v: tipoMasaSeleccionada!.1, t: tamaño!)
        }
        pushControllerWithName("TipoQueso", context: valorContexto)

        
    }

}
