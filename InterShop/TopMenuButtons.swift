import SwiftUI

struct TopMenuButtons: View {
    
    let name: String
    
    @Binding var showTop: Bool
    @Binding var showDetail: Bool
    
    var body: some View {
            VStack {
                Text(name)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor (showTop ? .selectedButtonColor : .staticButtonColor)
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 30, height: 4)
                    .offset(y: -10)
                    .foregroundColor(showTop ? .selectedButtonColor : .staticButtonColor)
                    .opacity(showTop ? 1 : 0)
                
        }
            .opacity(showDetail ? 0.5 : 1)            
    }
}

struct TopMenuButtons_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuButtons(name: "Name", showTop: .init(get: {true}, set: {_ in}), showDetail: .init(get: {false}, set: {_ in}))
    }
}
