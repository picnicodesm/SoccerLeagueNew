//
//  ScheduleCard.swift
//  SoccerLeagueNew
//
//  Created by 김상민 on 2022/07/19.
//

import SwiftUI

struct ScheduleCard: View {
    @EnvironmentObject var leagueVM: LeagueVM
    let cardSize: CGFloat = 350
    var isLoaded: Bool {
        if leagueVM.schedule_EPL.dateArr.count != 0 {
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
                        ForEach(leagueVM.schedule_EPL.dateArr.indices, id: \.self){ index in
                            if leagueVM.schedule_EPL.dateArr[index] == "" { // Game Score
                                GameRow(time: leagueVM.schedule_EPL.timeArr[index], score: leagueVM.schedule_EPL.scoreArr[index], stadium: leagueVM.schedule_EPL.stadiumArr[index], cardSize: cardSize)
                            } else {
                                Text("\(leagueVM.schedule_EPL.dateArr[index])") // Date
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
            .background(.clear)
        }
        .frame(width: cardSize, height: 360)
        .cornerRadius(10)
        .shadow(radius: 5)
        .foregroundColor(.white)
        .onAppear {
            if !isLoaded { leagueVM.getSchedule(); print("ChangedSchedule")}
        }
        //MARK: - one component
    }
}

struct ScheduleCard_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCard()
            .environmentObject(LeagueVM())
    }
}
