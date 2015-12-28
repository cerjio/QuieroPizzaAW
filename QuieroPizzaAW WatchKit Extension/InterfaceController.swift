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


    var valorContexto : Orden? = nil
    var tamañoSeleccionado : String = ""
    var nombreControlador : String = "TipoMasa"
    
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
            
            valorContexto?.masa = nil
            valorContexto?.queso = nil
            valorContexto?.ingredientes = nil
        }
        
        
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        /*let pickerItems :[WKPickerItem] = listaTamaño.map{
            let pickerItem = WKPickerItem()
            
            pickerItem.title = $0.0
            pickerItem.caption = $0.1

            return pickerItem
        }
        tamaño.setItems(pickerItems)
        tamaño.setSelectedItemIndex(0)
        tamañoSeleccionado = listaTamaño[0]
        */
       
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

   /* @IBAction func pickerSelectedItemChanged(value: Int) {
        
        tamañoSeleccionado = listaTamaño[value]
    }
    
    @IBAction func seleccionarTipoMasa() {
        var valorContexto : AnyObject? = nil
        if(tamañoSeleccionado != nil) {
            
            valorContexto = Taman_o(d: tamañoSeleccionado!.0, v: tamañoSeleccionado!.1)
        }
        pushControllerWithName("TipoMasa", context: valorContexto)
        
    }*/
    
    @IBAction func presionoBotonChica() {
        tamañoSeleccionado = "Chica"
        transitarPantalla()
    }
    
    @IBAction func presionoMediana() {
        tamañoSeleccionado = "Mediana"
        transitarPantalla()
    }
    
    @IBAction func presionoGrande() {
        tamañoSeleccionado = "Grande"
        transitarPantalla()
    }
    
    func transitarPantalla() {
        
        if(!tamañoSeleccionado.isEmpty) {
            
            valorContexto = Orden(tamaño: Taman_o(d: tamañoSeleccionado, v: tamañoSeleccionado )
                , masa: valorContexto?.masa, queso: valorContexto?.queso, ingredientes: valorContexto?.ingredientes, nombreControlador: "")        }
        pushControllerWithName(nombreControlador, context: valorContexto)
        
    }
    

    
}
