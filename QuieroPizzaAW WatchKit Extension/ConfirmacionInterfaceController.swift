//
//  ConfirmacionInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation



class ConfirmacionInterfaceController: WKInterfaceController {

    @IBOutlet var tamañoEtiqueta: WKInterfaceLabel!
    @IBOutlet var masaEtiqueta: WKInterfaceLabel!
    @IBOutlet var quesoEtiqueta: WKInterfaceLabel!
    @IBOutlet var ingredientesEtiqueta: WKInterfaceLabel!
    
    
    var tamaño : String? = nil
    var tipoMasa : String? = nil
    var tipoQueso : String? = nil
    var ingredientes : String? = nil
    var faltantes : [String] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Ingredientes
        tamaño = c.tamaño
        tipoMasa = c.tipoMasa
        tipoQueso = c.tipoQueso
        
        if c.ingredientesSeleccionados.count > 0 {
            
            ingredientes = c.ingredientesSeleccionados.joinWithSeparator(",")
        } else {
            ingredientes = nil
        }
        

        tamañoEtiqueta.setText(tamaño)
        masaEtiqueta.setText(tipoMasa)
        quesoEtiqueta.setText(tipoQueso)
        ingredientesEtiqueta.setText(ingredientes)
        
        if (tamaño?.isEmpty == nil) {
            faltantes.append("Tamaño")
        }
        
        if (tipoMasa?.isEmpty == nil) {
            faltantes.append("Tipo Masa")
        }
        
        if tipoQueso?.isEmpty == nil {
            faltantes.append("Tipo Queso")
        }
        
        if ingredientes?.isEmpty == nil {
            faltantes.append("Ingredientes")
        }
        
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
    
    
    @IBAction func cocinar() {
        
        if(faltantes.count > 0) {
            
            let okAction = WKAlertAction(title: "OK",
                style: WKAlertActionStyle.Default) { () -> Void in
                    
            }
                    
            presentAlertControllerWithTitle("Ooops", message: "Falta: " + faltantes.joinWithSeparator(","), preferredStyle: WKAlertControllerStyle.Alert, actions: [okAction])
            
        } else {
            
            let valor: AnyObject? = nil
            
            pushControllerWithName("Cocinar", context: valor)
            
        }
        
    }
    
    

}
