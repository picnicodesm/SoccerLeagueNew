//
//  RankingRow.swift
//  SoccerLeagueNew
//
//  Created by 김상민 on 2022/07/21.
//

import SwiftUI

struct RankingRow: View {
    var cardSize: CGFloat
    let viewWidth: CGFloat = UIScreen.main.bounds.width
    let rowHeight: CGFloat = 60
    let boxWidth: CGFloat = 50
    let borderColor: Color = .gray
    
    var rank: String
    var teamName: String
    var gameNum: String
    var score: String
    var win: String
    var draw: String
    var lose: String
    var goal: String
    var loseGoal: String
    var gainAndLoseDiffrence: String
    var img: Image
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 0) {
                Group {
                    Text("\(rank)")
                        .font(.system(size: 16))
                        .frame(width: boxWidth, height: rowHeight)
                    HStack(spacing: 0) {
                        img
                            .resizable()
                            .frame(width: 25, height: 25)
//                            .border(.yellow, width: 0.5)
                        
                        Text("\(teamName)")
                            .font(.system(size: 16))
//                            .frame(height: rowHeight)
                            .frame(width: 140)
//                            .border(.yellow, width: 0.5)
                    }
                    .frame(width: 200)
//                    .border(.gray, width: 0.5)
                }
                
                Group {
                    Text("\(gameNum)")
                        .font(.system(size: 16))
                        .frame(width: boxWidth + 10)
                    
                    Text("\(score)")
                        .frame(width: boxWidth)
                    
                    Text("\(win)")
                        .frame(width: boxWidth)
                    Text("\(draw)")
                        .frame(width: boxWidth)
                    Text("\(lose)")
                        .frame(width: boxWidth)
                    Text("\(goal)")
                        .frame(width: boxWidth)
                    Text("\(loseGoal)")
                        .frame(width: boxWidth)
                    Text("\(gainAndLoseDiffrence)")
                        .frame(width: boxWidth + 10)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: rowHeight)
            .overlay(Divider().background(.white), alignment: .bottom)
        }
        
    }
}
// 22    47    14    5    3    33    19    14
struct RankingRow_Previews: PreviewProvider {
    //     func t() -> Image {
    //        do {
    //            guard let urlImageString = URL(string: "https://search.pstatic.net/common?type=o&size=25x19&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fkeypage%2Fimage%2Fdss%2F%2F146%2F62%2F19%2F22%2F146_2621922_team_image_url_1520389441312.jpg") else { print("cna't make urlImageString"); return }
    //
    //            let data = try Data(contentsOf: urlImageString)
    //            guard let img = UIImage(data: data) else { print("There is no image"); return}
    //            let tImg = Image(uiImage: img)
    //            return tImg
    //        } catch {}
    //    }
    
    static var previews: some View {
        RankingRow(cardSize: 350, rank: "1", teamName: "수원 삼성 블루윙스", gameNum: "22", score: "47", win: "14", draw: "5", lose: "3", goal: "33", loseGoal: "19", gainAndLoseDiffrence: "14", img: Image(systemName: "applelogo"))
            .environmentObject(LeagueVM())
        
    }
}
