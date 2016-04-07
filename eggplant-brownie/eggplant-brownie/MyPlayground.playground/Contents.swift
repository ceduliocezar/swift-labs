class Item{
    var name: String
    var calories: Double
    init(name: String, calories: Double){
        self.name = name
        self.calories = calories
    }
    
}


class Meal{
    
    var name : String
    var hapiness : Int
    var items = Array<Item>()
    
    init(name:String , hapiness:Int){
        self.name = name
        self.hapiness = hapiness
    }
    
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        
        return total
    }
    
}

let brownie = Meal(name:"Eggplant brownie", hapiness: 5)
let item1 = Item(name : "brownie", calories: 115)

let item2 = Item(name: "vegam cream", calories:40)

brownie.items.append(item1)
brownie.items.append(item2)

print(brownie.allCalories())




