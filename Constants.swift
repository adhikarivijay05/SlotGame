//
//  Constants.swift
//  SlotGame
//
//  Created by Sachin on 19/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import Foundation
let myNames = ["Dragons and Dungeons","Sports of Risk","War Air","Felines","Space","Japanese","Luxury Cars","Motorcycle","Martial Arts","Ninja"]



var credits = 0
var currentBet = 0
var winnings = 0



class Scoring {
    
    static let sharedGameData = Scoring()
    
    var credits: Int = 10000
    var lastBet: Int = 1
    var winnings: Int = 0
    var noofLines: Int = 24
    var overallscore: Int = 0
    var winningPoints : Int = 0
    var gameLevel : Int = 0
    var lotteryTickets : Int = 0
    var lotteryNumbers : [String] = []
    init () {
        
    }
}

class Stages {
    
    var stages : String = ""
    var isstageCleared : Bool = false
    
}

