//
//  AppState.swift
//  DemoRedux
//
//  Created by Roma Patel on 30/08/22.
//

import Foundation

struct AppState: ReduxState {

  var message: Message
  var turn: Turn
  var playerFirstPlay: Play
  var playerSecondPlay: Play
  var result: Result?

  init() {
      self.message = .player1choose
      self.turn = Turn(player: .one)
      self.playerFirstPlay = Play(chosen: false, weapon: nil)
      self.playerSecondPlay = Play(chosen: false, weapon: nil)
  }
}

extension AppState {

  enum Message: String, Decodable, Encodable, Equatable{
      case player1choose = "PLAYER 1 - Choose your weapon:"
      case player2choose = "PLAYER 2 - Choose your weapon:"
      case player1Wins = "PLAYER 1 WINS!"
      case player2Wins = "PLAYER 2 WINS!"
      case draw = "Draw!"
  }

  struct Turn: Codable, Equatable {
    var player: Player
  }

  enum Player: Codable, Equatable {
      case one
      case two
  }

  struct Play: Codable, Equatable {
    var chosen: Bool
    var weapon: Weapon?
  }

  enum Result: Codable, Equatable {
    case draw
    case player1Wins
    case player2Wins
  }

  enum Weapon : String, Codable, Equatable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
  }
}
