//
//  RankingCard.swift
//  SoccerLeagueNew
//
//  Created by 김상민 on 2022/07/21.
//

import SwiftUI

struct RankingCard: View {
    @EnvironmentObject var leagueVM: LeagueVM
    let cardSize: CGFloat = 350
    let boxWidth: CGFloat = 50
    var isLoaded: Bool {
        if leagueVM.ranking_EPL.rank.count != 0 {
            return true
        } else { return false }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.2)
                .blur(radius: 1)
//            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack(alignment: .center, spacing: 0) {
                                    Group {
                                        Text("순위")
                                            .frame(width: boxWidth)
                                        Text("구단명")
                                            .frame(width: 200)
//                                            .border(.gray, width: 0.5)
                                    }
                                    Group {
                                        Text("경기 수")
                                            .frame(width: boxWidth + 10)
//                                            .border(.gray, width: 0.5)
                                        Text("승점")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                    
                                        Text("승")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                        Text("무")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                        Text("패")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                        Text("득점")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                        Text("실점")
                                            .frame(width: boxWidth)
//                                            .border(.gray, width: 0.5)
                                        Text("득실차")
                                            .frame(width: boxWidth + 10)
//                                            .border(.gray, width: 0.5)
                                    }
                                }
                        .font(.system(size: 16))
                        .frame(height: 30)
                        .overlay(Divider().background(.white), alignment: .bottom)
                        let rankInfo = leagueVM.ranking_EPL
                        
                        ForEach(rankInfo.rank.indices, id: \.self){ index in
                            RankingRow(cardSize: cardSize,
                                       rank: rankInfo.rank[index],
                                       teamName: rankInfo.teamName[index],
                                       gameNum: rankInfo.gameNum[index],
                                       score: rankInfo.score[index],
                                       win: rankInfo.win[index],
                                       draw: rankInfo.draw[index],
                                       lose: rankInfo.lose[index],
                                       goal: rankInfo.goal[index],
                                       loseGoal: rankInfo.lose[index],
                                       gainAndLoseDiffrence: rankInfo.gainAndLoseDiffrence[index],
                                       img: rankInfo.img[index])
                        }
                        
                    }
                }
//            }
//            .background(.clear)
        }
        .frame(width: cardSize)
//        .border(.gray, width: 1.5)
        .cornerRadius(10)
        .shadow(radius: 5)
        .foregroundColor(.white)
        .onAppear {
            if !isLoaded{ leagueVM.getRanking(); print("ChangedRanking") }
                
        }
    }
}

struct RankingCard_Previews: PreviewProvider {
    
    static var previews: some View {
        RankingCard()
            .environmentObject(LeagueVM())
    }
}
