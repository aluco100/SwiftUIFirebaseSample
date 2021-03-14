//
//  RegisterStrategyProtocol.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 11-03-21.
//

import Foundation

typealias RegisterStrategyCompletion = () -> Void
typealias RegisterStrategyFailure = (_ error: Error) -> Void

protocol RegisterStrategyProtocol: class {
    func register(_ registration: Registration, _ completion: @escaping RegisterStrategyCompletion, _ failure: @escaping RegisterStrategyFailure)
}
