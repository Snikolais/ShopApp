import Foundation
import SwiftUI

extension UIColor {
    public static var backgroundForSalePage: UIColor {
        return UIColor(named: "backgroundForSalePage")!
    }
    public static var backgroundWhenOpenShowDetail: UIColor {
        return UIColor(named: "backgroundWhenOpenShowDetail")!
    }
    public static var selectedButtonUIColor: UIColor {
        return UIColor(named: "selectedButtonColor")!
    }
}

extension Color {
    public static var selectedButtonColor: Color {
        return Color("selectedButtonColor")
    }
    public static var staticButtonColor: Color {
        return Color("staticButtonColor")
    }
    public static var backgroundForSalePage: Color {
          return Color("backgroundForSalePage")
      }
      public static var backgroundWhenOpenShowDetail: Color {
          return Color("backgroundWhenOpenShowDetail")
      }
    public static var cardBackground: Color {
        return Color("cardBackground")
    }
    
    public static var detailViewBackground: Color {
        return Color("detailViewBackground")
    }
}
