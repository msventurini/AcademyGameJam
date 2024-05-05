import Foundation
import GameController
import SpriteKit

//EXTENTION CONTROLLERS

extension GameScene {
    
    func setupVirtualController() {
        let controllerConfig = GCVirtualController.Configuration()
        
        controllerConfig.elements = [
            GCInputButtonA, GCInputButtonB,
            GCInputLeftThumbstick,
        ]
        
        let controller = GCVirtualController(configuration: controllerConfig)
        
        controller.connect()
        
        virtualController = controller
        
        actionVirtualButtons()
    }
    
    func actionVirtualButtons() {
        if let controller = virtualController?.controller {
            controller.extendedGamepad?.leftThumbstick.valueChangedHandler = { (dpad, xValue, yValue) in
                self.player?.movementCancel()
                self.playerMovement(direction: CGVector(dx: CGFloat(xValue), dy: CGFloat(yValue)))
                
                self.cancelInteraction()
            }
            
            controller.extendedGamepad?.buttonA.pressedChangedHandler = { button, value, pressed in
                if pressed {
                    self.interact()
                } else {
                    self.cancelInteraction()
                }
            }
            
            controller.extendedGamepad?.buttonB.pressedChangedHandler = { button, value, pressed in
                if pressed {
                    print("B")
                    
                    self.cancelInteraction()
                }
            }
        }
    }
    
    func playerMovement(direction: CGVector) {
        self.player?.move(x: direction.dx, y: direction.dy)
    }
    
    
    
    
}
