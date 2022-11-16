//
//  Inject.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation
import Swinject

@propertyWrapper
struct Inject<I> {
    let wrappedValue: I
    init() {
        self.wrappedValue = Assembler.sharedAssembler.resolver.resolve(I.self)!
    }
}
