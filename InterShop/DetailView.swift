import SwiftUI

struct DetailView: View {
    @Binding var showDetail: Bool
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16, content: {
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text("Man's Shoe")
                                .foregroundColor(.staticButtonColor)
                            Text("Nike Airmax Plus")
                                .bold()
                        })
                        
                        Spacer()
                        Text("300$")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    .padding(.horizontal)
                    
                    Text("Select Size")
                        .font(.caption)
                        .padding(.horizontal)
                    
                    VStack(alignment: .center, spacing: 8.0) {
                        HStack(alignment: .center, spacing: 8.0) {
                            sizeView1
                        }
                        HStack(alignment: .center, spacing: 8.0) {
                            sizeView2
                        }
                        HStack(alignment: .center, spacing: 8.0) {
                            sizeView3
                        }
                    }
                    .padding(.leading, 30)
                    
                    Button(action: {
                        //
                    }, label: {
                        Text("Add to bag")
                            .foregroundColor(.white)
                            .frame(width: 321, height: 44)
                            .background(Color.selectedButtonColor)
                            .cornerRadius(20)
                            .shadow(color: .selectedButtonColor,
                                    radius: 10,
                                    y: 10)
                            .padding(.leading, 30)
                    })
                })
                    .padding(.top, 10)
                    .frame(width: 383, height: 400)
                    .background(Color.detailViewBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2),
                            radius: 20,
                            y: 20)
            }
            
            Image(systemName: "xmark")
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                .offset(x: 160, y: 35)
                .onTapGesture {
                    self.showDetail = false
            }
        }
        
    }
    
    var sizeView1: some View {
        
        let inStock: [(String,  Bool)] = [("UK 5.5", true),
                                          ("UK 6 (EU 39)", true),
                                          ("UK 6 (EU 40)", true)]
        
        
        
        return ForEach(0..<inStock.count, id: \.self) { info in
            SizeView(size: inStock[info].0, inStock: inStock[info].1)
            
        }
    }
    
    var sizeView2: some View {
        
        let inStock: [(String,  Bool)] = [("UK 6.5", true),
                                          ("UK 7", true),
                                          ("UK 7.5", false)]
        
        return ForEach(0..<inStock.count, id: \.self) { info in
            SizeView(size: inStock[info].0, inStock: inStock[info].1)
        }
    }
    
    var sizeView3: some View {
        
        let inStock: [(String,  Bool)] = [("UK 8", true),
                                          ("UK 8.5", false),
                                          ("UK 9", true)]
        
        return ForEach(0..<inStock.count, id: \.self) { info in
            SizeView(size: inStock[info].0, inStock: inStock[info].1)
        }
    }
}


private struct SizeView: View {
    
    let size: String
    let inStock: Bool
    
    var body: some View {
        
        
        Text(size)
            .font(.footnote)
            .frame(width: 102, height: 41)
            .background(Color.backgroundForSalePage)
            .cornerRadius(5)
            .opacity(inStock ? 1: 0.2)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showDetail: .init(get: {true}, set: {_ in}))
    }
}
