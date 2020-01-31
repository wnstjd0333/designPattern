//기존의 코드를 건드리지 않고 확장(OCP준수)
protocol Coffee {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCoffee: Coffee{
    func getCost() -> Double {
        return 1.0
    }
    func getIngredients() -> String {
        return "Coffee"
    }
}

class CoffeeDecorator: Coffee{
    private let decoratedCoffee: Coffee
    private let ingredientSeparator: String = ", "
    
    required init(decoratedCoffee: Coffee){
        self.decoratedCoffee = decoratedCoffee
    }
    func getCost() -> Double {
        return decoratedCoffee.getCost()
    }
    func getIngredients() -> String {
        return decoratedCoffee.getIngredients() + ingredientSeparator
    }
}

class Milk: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }
    override func getCost() -> Double {
        return super.getCost() + 0.5
    }
    override func getIngredients() -> String {
        return super.getIngredients() + "Milk"
    }
}

class WhipCoffee: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }
    override func getCost() -> Double {
        return super.getCost() + 0.7
    }
    override func getIngredients() -> String {
        return super.getIngredients() + "Whip"
    }
}

var someCoffee: Coffee = SimpleCoffee()
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")

someCoffee = Milk(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")

someCoffee = WhipCoffee(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")

