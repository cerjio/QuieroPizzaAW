//
//  PedidoInterfaceController.swift
//  QuieroPizzaAW
//
//  Created by cerjio on 28/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import WatchKit
import Foundation


class PedidoInterfaceController: WKInterfaceController {

    @IBOutlet var pizzaTime: WKInterfaceLabel!
    var timer = NSTimer()
    var counter = 0
    var minuto = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        createTimer()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func createTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        
        
        if counter == 60 {
            minuto++
            timer.invalidate()
            counter = 0
            createTimer()
        }
        var labelSeconds : String = String(counter++)
        var labelMinutes : String = String(minuto)
        
        if labelSeconds.characters.count == 1 {
            
            labelSeconds = "0" + labelSeconds
        }
        
        
        if labelMinutes.characters.count == 1 {
            
            labelMinutes = "0" + labelMinutes
        }

        
        let display = "\(labelMinutes) : \(labelSeconds)"
        
        pizzaTime.setText(display)
        
        if minuto == 24 {
            timer.invalidate()
        }
    }

}
