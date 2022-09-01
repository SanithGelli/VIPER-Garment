//
//  GarmentViewModel.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation

struct GarmentViewModel {
    var name: String = ""
    var id: String = UUID().uuidString
    var createdDate: Date? = Date()
    
    init() {}
    
    init(garment: Garment) {
        self.id = garment.id ?? UUID().uuidString
        self.name = garment.name ?? ""
        self.createdDate = garment.createdDate
    }
}
