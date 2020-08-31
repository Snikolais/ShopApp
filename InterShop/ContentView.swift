import SwiftUI

extension Image {
    
    static var nikeLogo: Image { Image("2") }
}

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
                
                Image.nikeLogo
                    .padding()
                
                Spacer()
                
                categoriesView
                
                Spacer()
                
                ZStack {
                    cardsBehindProduct
                    productForCard
                }
                
                Spacer()
                
                buyNowButton
                    .padding(.bottom)
                
                HStack {
                    favoritesTitle
                     .padding(.leading, 30)
                    Spacer()
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 35) {
                        favoritesShoesView
                    }
                    .padding(.horizontal)
                    .padding(5)
                }
                
            }
            .disabled(showDetail)
            
            DetailView(showDetail: $showDetail)
                .offset(y: showDetail ? 0 : 600)
                .animation(.spring(response: 0.5,
                                   dampingFraction: 0.5,
                                   blendDuration: 0))
            
        }
    }
    
    private var categoriesView: some View {
        let titles = ["Hot", "Selling", "Pre-Sale"]
        
        return HStack (alignment: .top, spacing: 40) {
            
            ForEach(0..<titles.count, id: \.self) { info in
                TopMenuButtons(name: titles[info],
                               showTop: .init(get: {self.selectedTopButtonIndex == info}, set: {_ in}),
                               showDetail: .init(get: {self.showDetail}, set: {_ in}))
                    .onTapGesture(perform: {
                        self.selectedTopButtonIndex = info
                    })
            }
        }
         .foregroundColor(.staticButtonColor)
    }
    
    private var cardsBehindProduct: some View {
        
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
    
    var favoritesShoesView: some View {
        let imageName = ["3", "5", "1", "1"]
        
        return ForEach(0..<imageName.count, id: \.self) { index in
            FavoriteSelect(imageName: imageName[index],
                           isSelect: self.checkFavouriteIsSelected(shoeIndex: index))
                .onTapGesture(perform: {
                    self.selectedImageName = imageName[index]
                    self.selectedFavoriteItem = index
                })
        }
    }
    
    private func checkFavouriteIsSelected(shoeIndex: Int) -> Binding<Bool> {
        Binding(get: { self.selectedFavoriteItem == shoeIndex},
                set: { _ in })
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
