import Foundation
import SwiftUI
import SwiftSoup

class LeagueVM: ObservableObject {
    
    @Published var schedule_EPL = LeagueModel().eplGameInfoStruct
    @Published var ranking_EPL = LeagueModel().eplTeamRankingStruct
    
   
    func getSchedule() {
        let url = "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=k%EB%A6%AC%EA%B7%B8&oquery=k%EB%A6%AC%EA%B8%88&tqi=hmfMWlp0JXossLi4MilssssstXl-347839&acq=k%EB%A6%AC%EA%B7%B8&acr=10&qdt=0"
        
        guard let urlString = URL(string: url) else { print("url생성이 안됨"); return }
        
        do {
            let html = try String(contentsOf: urlString, encoding: .utf8)
            
            let doc: Document = try SwiftSoup.parse(html)
            let scheduleTableElement = try doc.select("tbody._scroll_content").select("tr")
            for el in scheduleTableElement.array() {
                let childrenNum = el.children().count
                if childrenNum > 2 {
                    schedule_EPL.stadiumArr.append(try el.select("td").get(2).text())
                } else {
                    schedule_EPL.stadiumArr.append("")
                }
                // el is <tr></trl>
                schedule_EPL.dateArr.append(try el.select("td.play_date").text())
                schedule_EPL.timeArr.append(try el.select("td.time").text())
                schedule_EPL.scoreArr.append(try el.select("td.score").text())
            }
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        
    }
    //MARK: - getSchedule()
    
 
    func getRanking() {
        let url = "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=k%EB%A6%AC%EA%B7%B8&oquery=k%EB%A6%AC%EA%B8%88&tqi=hmfMWlp0JXossLi4MilssssstXl-347839&acq=k%EB%A6%AC%EA%B7%B8&acr=10&qdt=0"
        
        guard let urlString = URL(string: url) else { print("url생성이 안됨"); return }
        
        do {
            let html = try String(contentsOf: urlString, encoding: .utf8)
            
            let doc: Document = try SwiftSoup.parse(html)
            let scheduleTableElement = try doc.select("div.scroll").select("table.tb_type2").select("tbody").select("tr")
            for el in scheduleTableElement.array() {
                // el is <tr></tr>
                ranking_EPL.rank.append(try el.select("th").text())
                ranking_EPL.teamName.append(try el.select("td").get(0).text())
                ranking_EPL.gameNum.append(try el.select("td").get(1).text())
                ranking_EPL.score.append(try el.select("td").get(2).text())
                ranking_EPL.win.append(try el.select("td").get(3).text())
                ranking_EPL.draw.append(try el.select("td").get(4).text())
                ranking_EPL.lose.append(try el.select("td").get(5).text())
                ranking_EPL.goal.append(try el.select("td").get(6).text())
                ranking_EPL.loseGoal.append(try el.select("td").get(7).text())
                ranking_EPL.gainAndLoseDiffrence.append(try el.select("td").get(8).text())
                
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
            
    }
    //MARK: - getRanking()
}
