//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Patrick Habib on 8/5/21.
//

import Foundation

extension Bundle{
    
    func decode<T: Codable>(_ file: String) -> T{
        //1.Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failes to locate \(file) in bundle")
        }
        //2.Create a property for the data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failes to locate \(file) in bundle")
        }
        //3. Create a decoder
        
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoded data
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failes to locate \(file) in bundle")
        }
        //5. Return the ready to use data
        return loaded
    }
}
