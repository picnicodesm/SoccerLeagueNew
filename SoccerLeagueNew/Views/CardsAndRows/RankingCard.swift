import SwiftUI

struct RankingCard: View {
    @EnvironmentObject var leagueVM: LeagueVM
    @State private var isLoaded: Bool = false
    let cardSize: CGFloat = 350
    let boxWidth: CGFloat = 50
    var leagueNumber: Int
    var hasData: Bool {
        if leagueVM.teamRankingStructs[leagueNumber].rank.count != 0 {
            return true
        } else { return false }
    }
    
    var body: some View {
        if hasData {
            
            ZStack {
                Rectangle()
                    .fill(.black)
                    .opacity(0.2)
                    .blur(radius: 1)
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack(alignment: .center, spacing: 0) {
                            Group {
                                Text("순위")
                                    .frame(width: boxWidth)
                                Text("구단명")
                                    .frame(width: 200)
                            }
                            Group {
                                Text("경기 수")
                                    .frame(width: boxWidth + 10)
                                Text("승점")
                                    .frame(width: boxWidth)
                                Text("승")
                                    .frame(width: boxWidth)
                                Text("무")
                                    .frame(width: boxWidth)
                                Text("패")
                                    .frame(width: boxWidth)
                                Text("득점")
                                    .frame(width: boxWidth)
                                Text("실점")
                                    .frame(width: boxWidth)
                                Text("득실차")
                                    .frame(width: boxWidth + 10)
                            }
                        }
                        .font(.system(size: 16))
                        .frame(height: 30)
                        .overlay(Divider().background(.white), alignment: .bottom)
                        let rankInfo = leagueVM.teamRankingStructs[leagueNumber]
                        
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
                                       gainAndLoseDiffrence: rankInfo.gainAndLoseDiffrence[index]
                                       //                                       img: rankInfo.img[index]
                            )
                        }
                    }
                } // ScrollView
            }
            .frame(width: cardSize)
            .cornerRadius(10)
            .shadow(radius: 5)
            .foregroundColor(.white)
            .onAppear {
//                if !isLoaded{ leagueVM.getRanking(leagueNumber: leagueNumber); print("rank isLoaded is \(isLoaded)") }
                
            } // ZStack
        } else {
            ZStack {
                Rectangle()
                    .fill(.black)
                    .opacity(0.2)
                    .blur(radius: 1)
                    .frame(width: 350, height: 350)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Text("시즌 중이 아닙니다.")
                    .foregroundColor(.white)
            }
            .onAppear {
                if !isLoaded {
//                    leagueVM.getRanking(leagueNumber: leagueNumber)
                    self.isLoaded = !isLoaded
                }
            }
        }
    }
}

struct RankingCard_Previews: PreviewProvider {
    
    static var previews: some View {
        RankingCard(leagueNumber: 1)
            .environmentObject(LeagueVM())
    }
}
