import SwiftUI

struct CardsWithProduct: View {
    
    let imageName: String
    let shoesName: String
    let dictionaryImageName: [String: String] = ["3" : "7", "5" : "8"]
    let dictionaryShoesName: [String: String] = ["3" : "Nike Air Max", "5" : "Nike Air Plus"]

    @Binding var showDetail: Bool
    
    var body: some View {

                VStack {
                    Image(dictionaryImageName[imageName] ?? "NotFound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 265, height: 368)
                        .overlay(showDetail ?
                            Color.backgroundWhenOpenShowDetail.opacity(0.2) :
                            Color.backgroundForSalePage.opacity(0))

                    Text(dictionaryShoesName[imageName] ?? "")
                        .foregroundColor(Color.staticButtonColor)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .offset(y: -40)
        }
    }
}

struct CardsWithProduct_Previews: PreviewProvider {
    static var previews: some View {
        CardsWithProduct(imageName: "3", shoesName: "Nike", showDetail: .constant(false))
    }
}
 
