import Foundation
import SwiftUI
import SwiftSoup

class LeagueVM: ObservableObject {
    /*
     0: EPL
     1: KL
     2: Leauge1
     3: Bundes
     4: laliga
     */
    @Published var gameInfoStructs = [
        leagues[0].gameInfoStruct,
        leagues[1].gameInfoStruct,
        leagues[2].gameInfoStruct,
        leagues[3].gameInfoStruct,
        leagues[4].gameInfoStruct,
    ]
    
    @Published var teamRankingStructs = [
        leagues[0].teamRankingStruct,
        leagues[1].teamRankingStruct,
        leagues[2].teamRankingStruct,
        leagues[3].teamRankingStruct,
        leagues[4].teamRankingStruct,
    ]

    func getSchedule(leagueNumber: Int) {
        let url = leagueString[leagueNumber]
        guard let urlString = URL(string: url) else { print("url생성이 안됨"); return }
        
            do {
                let html = try String(contentsOf: urlString, encoding: .utf8)
                
                let doc: Document = try SwiftSoup.parse(html)
                let scheduleTableElement = try doc.select("tbody._scroll_content").select("tr")
                for el in scheduleTableElement.array() {
                    let childrenNum = el.children().count
                    if childrenNum > 2 {
                        gameInfoStructs[leagueNumber].stadiumArr.append(try el.select("td").get(2).text())
                    } else {
                        gameInfoStructs[leagueNumber].stadiumArr.append("")
                    }
                    // el is <tr></trl>
                    gameInfoStructs[leagueNumber].dateArr.append(try el.select("td.play_date").text())
                    gameInfoStructs[leagueNumber].timeArr.append(try el.select("td.time").text())
                    gameInfoStructs[leagueNumber].scoreArr.append(try el.select("td.score").text())
                }
            } catch Exception.Error(_, let message) {
                print(message)
            } catch {
                print("error")
            }
       
    }
    //MARK: - getSchedule()
    
    func getRanking(leagueNumber: Int) {
        let url = leagueString[leagueNumber]
        
        guard let urlString = URL(string: url) else { print("url생성이 안됨"); return }
        
        switch leagueNumber {
        case 1:
            do {
                let html = try String(contentsOf: urlString, encoding: .utf8)
                
                let doc: Document = try SwiftSoup.parse(html)
                let scheduleTableElement = try doc.select("div.scroll").select("table.tb_type2").select("tbody").select("tr")
                for el in scheduleTableElement.array() {
                    // el is <tr></tr>
                    teamRankingStructs[1].rank.append(try el.select("th").text())
                    teamRankingStructs[1].teamName.append(try el.select("td").get(0).text())
                    teamRankingStructs[1].gameNum.append(try el.select("td").get(1).text())
                    teamRankingStructs[1].score.append(try el.select("td").get(2).text())
                    teamRankingStructs[1].win.append(try el.select("td").get(3).text())
                    teamRankingStructs[1].draw.append(try el.select("td").get(4).text())
                    teamRankingStructs[1].lose.append(try el.select("td").get(5).text())
                    teamRankingStructs[1].goal.append(try el.select("td").get(6).text())
                    teamRankingStructs[1].loseGoal.append(try el.select("td").get(7).text())
                    teamRankingStructs[1].gainAndLoseDiffrence.append(try el.select("td").get(8).text())
                   
                    // 이미지 하져오는 코드, 하지만 쓰지 않음.
                    //              get Image from HTML
                    //                let imgString = try el.select("td").get(0).select("a").select("img").attr("src").description
                    //                guard let urlImageString = URL(string: imgString) else { print("cna't make urlImageString"); return }
                    //                let data = try Data(contentsOf: urlImageString)
                    //                guard let img = UIImage(data: data) else { print("There is no image"); return}
                    //                ranking_EPL.img.append(Image(uiImage: img))
                    //
                    
                }
            } catch Exception.Error(_, let message) {
                print(message)
            } catch {
                print("error")
            }
        default:
            break
        }
    }
    //MARK: - getRanking()
}
