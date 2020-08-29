//
//  UserViewModel.swift
//  ExampleMVVM
//
//  Created by Álvaro Ávalos Hernández on 28/08/20.
//  Copyright © 2020 Álvaro Ávalos Hernández. All rights reserved.
//

import Foundation

class UserViewModel {
    typealias completionBlock = ([User]) -> ()
    var apiHandler = APIHandler()
    var dataSourceArray = [User]()
    
    func getDataFromAPIHandlerClass(url: String, completionBlock: @escaping completionBlock) {
        apiHandler.getDataFromAPI(with: url) { [weak self] (usersArray) in
            self?.dataSourceArray = usersArray
            completionBlock(usersArray)
        }
    }
    
    func getNumberOfRowsInSection() -> Int {
        return dataSourceArray.count
    }
    
    func getUsetAtArray(in index: Int) -> User {
        return dataSourceArray[index]
    }
    
}
