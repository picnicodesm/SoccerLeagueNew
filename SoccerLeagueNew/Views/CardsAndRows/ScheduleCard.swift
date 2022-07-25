import SwiftUI

struct ScheduleCard: View {
    @EnvironmentObject var leagueVM: LeagueVM
    let cardSize: CGFloat = 350
    var leagueNumber: Int
    var isLoaded: Bool {
        if leagueVM.gameInfoStructs[leagueNumber].dateArr.count != 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.2)
                .blur(radius: 1)
            VStack(spacing: 0) {
                Text("경기 일정")
                    .font(.system(size: 16))
                    .frame(width: cardSize, height: 30)
                    .overlay(Divider().background(.white), alignment: .bottom)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(leagueVM.gameInfoStructs[leagueNumber].dateArr.indices, id: \.self){ index in
                            if leagueVM.gameInfoStructs[leagueNumber].dateArr[index] == "" { // Game Score
                                GameRow(time: leagueVM.gameInfoStructs[leagueNumber].timeArr[index],
                                        score: leagueVM.gameInfoStructs[leagueNumber].scoreArr[index],
                                        stadium: leagueVM.gameInfoStructs[leagueNumber].stadiumArr[index],
                                        cardSize: cardSize
                                )
                            } else {
                                Text("\(leagueVM.gameInfoStructs[leagueNumber].dateArr[index])") // Date
                                    .font(.system(size: 20))
                                    .frame(width: cardSize)
                                    .padding(.vertical, 5)
                                    .overlay(Divider().background(.white), alignment: .bottom)
//                                    .border(.gray, width: 0.5)
                            }
                        }
                        
                    }
                }
            }
        }
        .frame(width: cardSize, height: 360)
        .cornerRadius(10)
        .shadow(radius: 5)
        .foregroundColor(.white)
        .onAppear {
//            if !isLoaded { leagueVM.getSchedule(leagueNumber: leagueNumber); print("ChangedSchedule")}
        }
        //MARK: - one component
    }
}

struct ScheduleCard_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCard(leagueNumber: 1)
            .environmentObject(LeagueVM())
    }
}
