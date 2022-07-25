import Foundation
import SwiftUI

struct LeagueModel {
    var gameInfoStruct = GameInfo()
    var teamRankingStruct = TeamRanking()
    
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
/*
 0: EPL
 1: KL
 2: Leauge1
 3: Bundes
 4: laliga
 */

var leagues: [LeagueModel] = [LeagueModel(), LeagueModel(),
LeagueModel(),
LeagueModel(),
LeagueModel()]
let leagueString: [String] = [
    "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=epl",
    "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=k%EB%A6%AC%EA%B7%B8&oquery=k%EB%A6%AC%EA%B8%88&tqi=hmfMWlp0JXossLi4MilssssstXl-347839&acq=k%EB%A6%AC%EA%B7%B8&acr=10&qdt=0",
    "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%A6%AC%EA%B7%B81&oquery=k%EB%A6%AC%EA%B7%B8&tqi=hmfMXlp0Yihss4xCiy4sssssszh-041356",
    "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%84%EB%8D%B0%EC%8A%A4&oquery=%EB%A6%AC%EA%B7%B81&tqi=hmfMHsp0JXVssl8HLblssssss5G-288046",
    "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EB%9D%BC%EB%A6%AC%EA%B0%80"
]
