import Foundation
import SwiftUI

struct LeagueModel {
    var eplGameInfoStruct = GameInfo()
    var eplTeamRankingStruct = TeamRanking()
    
    struct GameInfo {
        var dateArr: [String] = []
        var timeArr: [String] = []
        var scoreArr: [String] = []
        var stadiumArr: [String] = []
    }
    
    struct TeamRanking {
        var rank: [String] = []
        var teamName: [String] = []
        var gameNum: [String] = []
        var score: [String] = []
        var win: [String] = []
        var draw: [String] = []
        var lose: [String] = []
        var goal: [String] = []
        var loseGoal: [String] = []
        var gainAndLoseDiffrence: [String] = []
//        var img: [Image] = []
    }
}
