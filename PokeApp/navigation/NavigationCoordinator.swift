//
//  NavigationCoordinator.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import Foundation
import SwiftUI

//Esto coordina las tabs y el stack de cada tab.
@Observable //Apartir de iOS 17, si no hay que usar ObservableObject
class NavigationCoordinator  {
    var homePath = NavigationPath()
    var selectedTab: Tab = .home

    func navigate(to route: PokeAppRoute) {
        switch route {
        case .home(let homeRoute):
            homePath.append(homeRoute)
        case .game:
            break
        case .pokeType:
            break
        }
        changeTabIfNeeded(route)
    }

    func changeTabIfNeeded(_ newRoute: PokeAppRoute) {
        if (newRoute.tab != selectedTab) {
            resetTab(selectedTab)
            selectedTab = newRoute.tab
        }
    }

    func goBack() {
        if !homePath.isEmpty {
            homePath.removeLast()
        }
    }

    //Habría que resetear cada caso....
    func resetTab(_ tab: Tab) {
        switch tab {
        case .home:
            homePath = NavigationPath()
        case .pokeTypes:
            break
        case .game:
            break
        }

    }
}

