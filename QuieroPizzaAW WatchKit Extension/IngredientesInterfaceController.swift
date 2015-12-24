//
//  IngredientesInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 24/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesInterfaceController: WKInterfaceController {

    @IBOutlet var tablaIngredientes: WKInterfaceTable!
    
    let ingredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Pimiento", "Anchoa"]
    
    var ingredientesSeleccionados: [String] = []
    
    var tamaño : String? = nil
    var tipoMasa : String? = nil
    var tipoQueso : String? = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! TipoQueso
        tamaño = c.tamaño
        tipoMasa = c.tipoMasa
        tipoQueso = c.descripcion
        
        loadTableData()
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
    
    func loadTableData() {
        tablaIngredientes.setNumberOfRows(ingredientes.count, withRowType: "IngredientesRow")
        
        for(index, ingrediente) in ingredientes.enumerate() {
            
            let row = tablaIngredientes.rowControllerAtIndex(index) as! IngredientesRow
            row.imagen.setImage(UIImage(named: "unchecked"))
            row.etiqueta.setText(ingrediente)
            
            
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let renglon = tablaIngredientes.rowControllerAtIndex(rowIndex) as! IngredientesRow
    
       
        if ingredientesSeleccionados.indexOf(ingredientes[rowIndex]) != nil {
            renglon.etiqueta.setTextColor(UIColor.whiteColor())
           ingredientesSeleccionados =  ingredientesSeleccionados.filter{$0 != ingredientes[rowIndex]}
        } else {
            renglon.etiqueta.setTextColor(UIColor.greenColor())
            ingredientesSeleccionados.append(ingredientes[rowIndex])
        }
        
        
    }
    
    @IBAction func preConfirmar() {
        
        let valorContexto = Ingredientes(ingreSel: ingredientesSeleccionados, v: ingredientesSeleccionados, t: tamaño!, tm: tipoMasa!, tq: tipoQueso!)

        pushControllerWithName("Confirmacion", context: valorContexto)

        
    }
    

}
