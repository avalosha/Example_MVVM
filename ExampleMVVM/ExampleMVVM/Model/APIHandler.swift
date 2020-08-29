//
//  APIHandler.swift
//  ExampleMVVM
//
//  Created by Álvaro Ávalos Hernández on 28/08/20.
//  Copyright © 2020 Álvaro Ávalos Hernández. All rights reserved.
//

import Foundation

class APIHandler {
    
    typealias completionBlock = ([User]) -> ()
    
    func getDataFromAPI(with urlString: String, completionBlock: @escaping completionBlock) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if data != nil {
                let userArray = try? JSONDecoder().decode([User].self, from: data!)
                if userArray != nil {
                    completionBlock(userArray!)
                } else {
                    let emptyArray = [User]()
                    completionBlock(emptyArray)
                }
            } else {
                print("Error:  \(String(describing: error))")
                let emptyArray = [User]()
                completionBlock(emptyArray)
            }
            
            }).resume()
    }
}
