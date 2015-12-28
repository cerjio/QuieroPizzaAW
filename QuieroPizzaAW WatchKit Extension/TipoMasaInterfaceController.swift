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

    var valorContexto : Orden? = nil
    var masaSeleccionada : String = ""
    var nombreControlador : String = "TipoQueso"

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
            
            valorContexto?.queso = nil
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
    
    @IBAction func masaDelgada() {
       masaSeleccionada = "Delgada"
        transitarPantalla()
    }
    
    @IBAction func masaCrujiente() {

        masaSeleccionada = "Crujiente"
        transitarPantalla()
        
    }
   
    @IBAction func masaGruesa() {
        masaSeleccionada = "Gruesa"
        transitarPantalla()
    }
    
    
    func transitarPantalla() {
        
        if(!masaSeleccionada.isEmpty) {
            
            valorContexto = Orden(tamaño: valorContexto?.tamaño
                , masa: TipoMasa(d: masaSeleccionada, v: masaSeleccionada), queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "")        }
        pushControllerWithName(nombreControlador, context: valorContexto)
        
    }


}
