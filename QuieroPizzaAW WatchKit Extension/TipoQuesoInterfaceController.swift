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
    
    var valorContexto : Orden? = nil
    var quesoSeleccionado : String = ""
    var nombreControlador : String = "Ingredientes"

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
            
        } else {
            
            valorContexto?.ingredientes = nil
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
    
    @IBAction func seleccionoMozarela() {
        quesoSeleccionado = "Mozarela"
        transitarPantalla()
    }
    
    @IBAction func seleccionoChedar() {
        quesoSeleccionado = "Chedar"
        transitarPantalla()
    }
    
    @IBAction func seleccionoParmesano() {
        quesoSeleccionado = "Parmesano"
        transitarPantalla()
    }
    
    
    func transitarPantalla() {
        
        if(!quesoSeleccionado.isEmpty) {
            
            valorContexto = Orden(tamaño: valorContexto?.tamaño
                , masa: valorContexto?.masa, queso: TipoQueso(d: quesoSeleccionado, v: quesoSeleccionado), ingredientes: valorContexto?.ingredientes, nombreControlador: "")        }
        pushControllerWithName(nombreControlador, context: valorContexto)
        
    }

    

}
