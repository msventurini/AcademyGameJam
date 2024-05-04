import Foundation
import GameController
import SpriteKit

//EXTENTION CONTROLLERS

extension WorldScene {
    
    func setupVirtualController() {
        let controllerConfig = GCVirtualController.Configuration()
        
        controllerConfig.elements = [
            GCInputButtonA, GCInputButtonB,
            GCInputLeftThumbstick,
        ]
        
        let controller = GCVirtualController(configuration: controllerConfig)
        controller.connect()
        
        virtualController = controller
    }
    
    func actionVirtualButtons() {
        guard let controller = GCController.controllers().first else { return }
        
        controller.extendedGamepad?.leftThumbstick.valueChangedHandler = { (dpad, xValue, yValue) in
            
            self.playerMovement(direction: CGVector(dx: CGFloat(xValue), dy: CGFloat(yValue)))
               }
        
        controller.extendedGamepad?.buttonA.pressedChangedHandler = { button, value, pressed in
            if pressed {
                self.buttonAPressed()
            }
        }
        
        controller.extendedGamepad?.buttonB.pressedChangedHandler = { button, value, pressed in
            if pressed {
                self.buttonBPressed()
            }
        }
        
    }
    
    func buttonAPressed() {
        print("A")
    }
    
    func buttonBPressed() {
        print("B")
    }
    
    func playerMovement(direction: CGVector) {
        self.player?.move(x: direction.dx, y: direction.dy)
    }

}
