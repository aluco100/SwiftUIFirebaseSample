//
//  RegisterStrategyContext.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 11-03-21.
//

import Foundation

class RegisterStrategyContext {
    
    //MARK: - Strategy
    
    func strategy(_ withPassword: Bool) -> RegisterStrategyProtocol {
        return withPassword ? RegisterEmailStrategy() : RegisterThirdPartyStrategy()
    }
    
}
