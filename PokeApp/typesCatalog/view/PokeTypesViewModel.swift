//
//  PokeTypesViewModel.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 18/6/25.
//

import Observation
import Foundation

@Observable
class PokeTypesViewModel {
    private var userCase: TypesUseCase
    var types: [PokeType]? = nil

    init(_ userCase: TypesUseCase) {
        self.userCase = userCase
        fetchAndUpdateTypes()
    }

    
    func fetchAndUpdateTypes() {
        Task {
            let newTypes = await userCase.execute()
            let uitypes = newTypes?.map({$0.toUIModel()})
            await updateTypes(with: uitypes)
            
        }
    }
    
    @MainActor
    func updateTypes(with list: [PokeType]?) {
        self.types = list
    }
    
}
