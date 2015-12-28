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
    
    
    
    var valorContexto : Orden? = nil
    var quesoSeleccionado : String = ""
    var nombreControlador : String = "Cocinar"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        if context != nil {
            
            let c : Orden? = (context as! Orden)
            
            if c != nil {
                valorContexto = c
                
                tamañoEtiqueta.setText(valorContexto?.tamaño?.descripcion)
                masaEtiqueta.setText(valorContexto?.masa?.descripcion)
                quesoEtiqueta.setText(valorContexto?.queso?.descripcion)
                ingredientesEtiqueta.setText(valorContexto?.ingredientes?.ingredientesSeleccionados.joinWithSeparator(","))
                if !(c?.nombreControlador)!.isEmpty {
                    nombreControlador = (c?.nombreControlador)!
                }
                
                
                if valorContexto?.ingredientes?.ingredientesSeleccionados.count <= 0 {
                    faltantes.append("Ingredientes")
                }
            }
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
                    
            presentAlertControllerWithTitle("Ooops", message: "Faltan: " + faltantes.joinWithSeparator(","), preferredStyle: WKAlertControllerStyle.Alert, actions: [okAction])
            
        } else {
            
            let valor: AnyObject? = nil
            
            presentControllerWithName("Cocinar", context: valor)
            
        }
        
    }
    
    @IBAction func cambiarOrden() {
        
        
        valorContexto = Orden(tamaño: valorContexto?.tamaño
            , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "")
        
        pushControllerWithName("CambioOrden", context: valorContexto)
        
    }
    

}
