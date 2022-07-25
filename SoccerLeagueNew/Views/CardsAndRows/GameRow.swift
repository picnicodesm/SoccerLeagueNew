import SwiftUI

struct GameRow: View {
    var time: String
    var score: String
    var stadium: String
    var cardSize: CGFloat
    let viewWidth: CGFloat = UIScreen.main.bounds.width
    let rowHeight: CGFloat = 80
    let borderColor: Color = .gray
    var body: some View {
        let scoreArr = score.split(separator: " ").map { String($0) }
        let leftTeam = scoreArr.first // 이건 nil이 아닌데 asset에 이미지가 없는거임.
        let rightTeam = scoreArr.last
        HStack(alignment: .center) {
            Text("\(time)")
                .font(.system(size: 14))
                .frame(width: 60)
            Spacer()
            Image(leftTeam ?? "")
                .resizable()
                .frame(width: 25, height: 25)
            Text("\(score)")
                .font(.system(size: 14))
            Image(rightTeam ?? "")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Text("\(stadium)")
                .font(.system(size: 12))
                .frame(width: 80)
        }
        .frame(width: cardSize, height: rowHeight)
        .overlay(Divider().background(.white), alignment: .bottom)
//        .background(.gray) // for test
    }
    
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(time: "18:00", score: "성남 1 : 1 수원", stadium: "DGB대구은행파크", cardSize: 350)
    }
}
