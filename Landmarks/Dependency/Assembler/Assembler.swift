//
//  Assembler.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([
                ServiceAssembly(),
                InteractorAssembly()
            ], container: container
        )
        return assembler;
    }()
}
