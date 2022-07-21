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
        HStack(alignment: .center) {
            Text("\(time)")
                .font(.system(size: 14))
                .frame(width: 60)
            Spacer()
            Text("\(score)")
                .font(.system(size: 20))
            Spacer()
            Text("\(stadium)")
                .font(.system(size: 12))
                .frame(width: 80)
        }
//        .padding(.horizontal)
        .frame(width: cardSize, height: rowHeight)
//        .border(borderColor, width: 0.5)
        .overlay(Divider().background(.white), alignment: .bottom)
//        .background(.gray) // for test
    }
    
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(time: "18:00", score: "성남 1 : 1 수원", stadium: "DGB대구은행파크", cardSize: 350)
    }
}
