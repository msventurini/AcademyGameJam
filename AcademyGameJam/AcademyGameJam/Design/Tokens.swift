//
//  Tokens.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import UIKit

struct Tokens {}

extension Tokens {
    // TODO: This shouldn't be like this.
    static func green() -> UIColor {
        let green1: UIColor = .init(red: 82/255, green: 255/255, blue: 0/255, alpha: 1)
        let green2: UIColor = .init(red: 54/255, green: 169/255, blue: 0/255, alpha: 1)
        let green3: UIColor = .init(red: 42/255, green: 111/255, blue: 10/255, alpha: 1)
        
        return [green1, green2, green3].randomElement()!
    }
}
