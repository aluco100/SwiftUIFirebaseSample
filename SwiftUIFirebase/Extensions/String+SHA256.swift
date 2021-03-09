//
//  String+SHA256.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 09-03-21.
//

import Foundation
import CryptoKit

extension String {
    
    func sha256() -> String {
        let inputData = Data(self.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
}
