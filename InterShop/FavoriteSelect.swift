import SwiftUI

struct FavoriteSelect: View {
    
    let imageName: String
    
    @Binding var isSelect: Bool
    
    var body: some View {
       
            Image(imageName)
                .renderingMode(.original)
                .overlay(isSelect ? RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.selectedButtonColor, lineWidth: 3) : nil)
    }
}

struct FavoriteSelect_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteSelect(imageName: "3", isSelect: .init(get: {true}, set: {_ in}))
    }
}
