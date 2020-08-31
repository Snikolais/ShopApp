import SwiftUI

struct ContentView: View {
    
    @State private var showDetail: Bool = false
    @State private var showTop: Bool = false
    
    @State private var selectedTopButtonIndex: Int = 0
    @State private var selectedFavoriteItem: Int = 0
    @State private var selectedImageName: String = "3"
        
    var body: some View {
        ZStack {
            Color(showDetail ? .backgroundWhenOpenShowDetail : .backgroundForSalePage)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("2")
                    .padding()
                Spacer()
                
                HStack (alignment: .top, spacing: 40) {
                    topMenuButtons
                }.foregroundColor(.staticButtonColor)

                
                Spacer()
                
                ZStack {
                    
                   cardsBehindProduct
                    
                    ZStack {
                        VStack {
  
                         productForCard
                        }
                    }
                }
                
                Spacer()
                
                buyNowButton
                    .padding()
                
                HStack {
                    favoritesTitle
                        .padding(.leading, 30)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 35) {
                        favoritesShoes
                        
                    }
                    .padding(.horizontal)
                    .padding(5)
                }
                
            }
            .disabled(showDetail)
            
            DetailView(showDetail: $showDetail)
                .offset(y: showDetail ? 0 : 600)
                .animation(.spring(response: 0.5,
                                   dampingFraction: 0.6,
                                   blendDuration: 0))
            
        }
    }
    
    var topMenuButtons: some View {
        
    let titles = ["Hot", "Selling", "Pre-Sale"]
        
        return ForEach(0..<titles.count, id: \.self) { info in
            TopMenuButtons(name: titles[info],
                           showTop: .init(get: {self.selectedTopButtonIndex == info}, set: {_ in}),
                           showDetail: .init(get: {self.showDetail}, set: {_ in}))
            .onTapGesture(perform: {
                self.selectedTopButtonIndex = info
            })
        }
    }
    
    var cardsBehindProduct: some View {
        
        ZStack {
            Spacer()
                .frame(width: 275.0, height: 368.0)
                .background(showDetail ? Color.backgroundWhenOpenShowDetail : .backgroundForSalePage)
                .cornerRadius(42)
                .shadow(radius: 35, y: 20)
                .rotationEffect(.degrees(8))
                .offset(x: 30, y: -30)
                .padding(.top)
            
            Spacer()
                .frame(width: 275.0, height: 368.0)
                .background(showDetail ? Color.backgroundWhenOpenShowDetail : .backgroundForSalePage)
                .cornerRadius(42)
                .shadow(radius: 35, y: 20)
                .rotationEffect(.degrees(-8))
                .offset(x: -30, y: -30)
                .padding(.top, 50)
            
            Spacer()
            .frame(width: 275, height: 368)
            .background(showDetail ? Color.backgroundWhenOpenShowDetail : .backgroundForSalePage)
            .cornerRadius(42)
            .shadow(radius: 5)
        }
    }
    
    var productForCard: some View {
        let products: [[String]] = [[selectedImageName, "Nike Air Zoom Pegasus 37"]]

        return ForEach(0..<products.count, id: \.self) { index in
            CardsWithProduct(imageName: products[index][0],
                             shoesName: products[index][1],
                             showDetail: .init(get: {
                                self.showDetail
                             }, set: {_ in}))

            
            
        }
        
    }
    
    var buyNowButton: some View {
        
        Button(action: {
            self.showDetail.toggle()
        }, label: {
            Text("Buy Now")
                .foregroundColor(.white)
                .frame(width: 169, height: 42)
                .background(Color.selectedButtonColor)
                .cornerRadius(20)
                .shadow(color: Color.selectedButtonColor.opacity(0.5),
                        radius: 10,
                        y: 10)
        })
    }
    
    var favoritesTitle: some View {
        Text("Favorites")
            .font(.system(size: 19, weight: .medium, design: .rounded))
        
        
    }
    
    var favoritesShoes: some View {
        
        let imageName = ["3", "5", "1", "1"]
        
        return ForEach(0..<imageName.count, id: \.self) { index in
            FavoriteSelect(imageName: imageName[index],
                           isSelect: .init(get: { self.selectedFavoriteItem == index}, set: {_ in}))
                .onTapGesture(perform: {
                    self.selectedImageName = imageName[index]
                    self.selectedFavoriteItem = index
                })
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
