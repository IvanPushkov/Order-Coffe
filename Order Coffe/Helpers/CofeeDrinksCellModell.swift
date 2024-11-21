

import Foundation

class CofeeDrinksCellModell{
    let name: String
    let startPrice: Int
    let imageData: Data
    
    var count: Int = 0
    var totalPrice: String {
        if count >= 1{
          return  String(startPrice * count)
        } else {
         return   String(startPrice)
        }
    }
    
    init(name: String, imageData: Data, startPrice: Int){
        self.name = name
        self.startPrice = startPrice
        self.imageData = imageData
    }
    
    func increaseCount(){
        count += 1
    }
     func reduceCount(){
        if count >= 1{
            count -= 1
        }
    }
}
