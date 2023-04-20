//
//  GameState.swift
//  RPS
//
//  Created by Антон Адамсон on 03.02.2023.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Камень, ножницы, бумага?"
        case .win:
            return "Ты победил! 😡"
        case .lose:
            return "Ты проиграл! 😎"
        case .draw:
            return "Ничья 😐"
        }
    }
    
}
