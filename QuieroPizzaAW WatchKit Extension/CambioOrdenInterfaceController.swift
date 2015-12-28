//
//  CambioOrdenInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 28/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class CambioOrdenInterfaceController: WKInterfaceController {

    var valorContexto : Orden? = nil
    var nombreControlador : String = "Confirmacion"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if context != nil {
            
            let c : Orden? = (context as! Orden)
            
            if c != nil {
                valorContexto = c
                
                if !(c?.nombreControlador)!.isEmpty {
                    nombreControlador = (c?.nombreControlador)!
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

    @IBAction func cambiarTamaño() {
        
        
        valorContexto = Orden(tamaño: valorContexto?.tamaño
            , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "Confirmacion")
        
        pushControllerWithName("Tamaño", context: valorContexto)
        
    }
    
    @IBAction func cambiarMasa() {
        valorContexto = Orden(tamaño: valorContexto?.tamaño
            , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "Confirmacion")
        
        pushControllerWithName("TipoMasa", context: valorContexto)
    }
   
    @IBAction func cambiarQueso() {
        valorContexto = Orden(tamaño: valorContexto?.tamaño
            , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "Confirmacion")
        
        pushControllerWithName("TipoQueso", context: valorContexto)
    }
    
    @IBAction func cambiarIngredientes() {
        valorContexto = Orden(tamaño: valorContexto?.tamaño
            , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "Confirmacion")
        
        pushControllerWithName("Ingredientes", context: valorContexto)

    }
    
    
}
