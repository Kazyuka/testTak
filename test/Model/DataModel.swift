//
//  DataModel.swift
//  test
//
//  Created by Руслан Казюка on 06.04.2018.
//  Copyright © 2018 Руслан Казюка. All rights reserved.
//

import Foundation

struct DataModel {
    
    var numberElement: Int?
    
    static func getNumbers() -> [DataModel] {
        var arrayData = [DataModel]()
        for index in 0...5 {
            let data = DataModel.init(numberElement: index)
            arrayData.append(data)
        }
        return arrayData
    }
}
