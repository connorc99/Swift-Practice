Swift Guide

### The basics

- Constants are common in Swift

- Tuples can be used to return multiply values from a function

- Optional types are used to handle absence of a value

- Constants/ variables:

  

  ```swift
  let maxAttempts = 10
  var currAttempts = 0
  
  var x=3, y=2, c=1
  ```

  

Printing strings

```swift
print("The current value of friendlyWelcome is \(friendlyWelcome)")
```



Tuples group multiple values together

```swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
```

Optionals

- Used when a value may be absent
- Either there is a value or there is not a value

```swift
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
```

### Terenary Operators

```swift
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
```

#### Range Operators

- Closed is for values inclusive from (a..b)

- Half-Open is for (a, b) before b

- One sided is from x to end

- ```swift
  for index in 1...5 {} //closed, 1 thru 5
  for index in 1..<5 //open, 1 thru 4
  for i in names[2...]{}
  ```

#### String Interpolation

- Prefix inserted strings with a \

  ```swift
  let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
  ```

  

## Arrays

- Arrays are values in ordered lists

- To create an empty array

  ```swift
  var someInts: [Int] = []
  print("someInts has \(someInts.count) items")
  someInts.append(3)
  ```

- We can create an array of default values

  ```swift
  var threeDoubles = Array(repeating: 0.0, count:3)
  
  shoppingList.insert("Maple Syrup", at: 0) //insert at index
  shoppingList.isEmpty //for boolean checking
  let apples = shoppingList.removeLast() //removes and assigns
  ```

- To iterate over arrays

  ```swift
  for item in shoppingList {
  	print(item)
  }
  
  for (index, value) in shoppingList.enumerated() {
    print("Item \(index+1) has a value of \(value)")
  }
  ```

  

### Dictionaries

- Must conform to the hashable protocol

- Can be written as [Key:Value]

  ```swift
  var nameOfIntegers: [Int: String] = [:] //creates empty dictionary
  namesOfIntegers[16] = "sixteen" //stores 16 as key for text
  
  var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
  
  print("The airports dictionary contains \(airports.count) items.")
  
  if airports.isEmpty {
      print("The airports dictionary is empty.")
  } else {
      print("The airports dictionary isn't empty.")
  }
  
  airports["LHR"] = "Heathrow" //adds
  airports["LHR"] = "London Heathrow" //updates
  
  for (airportCode, airportName) in airports {
      print("\(airportCode): \(airportName)")
  }
  
  
  let airportCodes = [String](airports.keys)
  ```

### Switch Statements

```swift
let someCharacter: Character = "z"
switch someCharacter {
case "a", "A":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
```

- No fallthrough, implicit break at end of matching case used
- Cannot have empty case

### Gaurd statement

- Executes depending on boolean value of an expression
- Requires a condition be true for condition to execute
  - Must haev an else clause

### Functions

- Self contained chunks of code to perform a specific task
- Each function has a type, which can be used as a parameter in other functions

#### Defining a function

- Can optionally provide parameters

- Can optionally define return type

  ```swift
  func greet(person: String) -> String {
  	...
    return greeting
  }
  
  print(greet(person:"Brian"))
  
  func greet(person: String, alreadyGreeted: Bool) -> String {
      if alreadyGreeted {
          return greetAgain(person: person)
      } else {
          return greet(person: person)
      }
  }
  print(greet(person: "Tim", alreadyGreeted: true))
  // Prints "Hello again, Tim!"
  ```

  

- Return types are not required

#### Functions with Multiple Return Values

- Can use tuples as a return type with compound of values

  ```swift
  func minMax(array:[Int]) -> (min: Int, max: Int) {
    ...
    return (currentMin, currentMax)
  }
  //return values are labeled as min and max
  
  let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
  print("min is \(bounds.min) and max is \(bounds.max)")
  // Prints "min is -6 and max is 109"
  ```

#### Function argument labels and parameter names

- Functions have both an argument label and a parameter name

  ```
  someFunc(param1: 1, param2: 2)
  ```

- Argument labels are written before parameter names, seperated by a space

  ```kotlin
  func someFunction(argumentLabel parameterName: Int) {
      // In the function body, parameterName refers to the argument value
      // for that parameter.
  }
  
  func greet(person: String, from hometown: String) -> String {
      return "Hello \(person)!  Glad you could visit from \(hometown)."
  }
  print(greet(person: "Bill", from: "Cupertino"))
  // Prints "Hello Bill!  Glad you could visit from Cupertino."
  ```

- Labels can be omitted using an _, otherwise calling function must use label

  ```swift
  func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
      // In the function body, firstParameterName and secondParameterName
      // refer to the argument values for the first and second parameters.
  }
  someFunction(1, secondParameterName: 2)
  ```

  

### Closures

- Self contained blocks of code that can be passed around and used
- Similar to lamba expressoins

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

### Enumerations

- Groups of objects

  ```swift
  enum CompassPoint {
      case north
      case south
      case east
      case west
  }
  
  enum Planet {
      case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
  }
  
  var directionToHead = CompassPoint.west
  directionToHead = .east
  
  directionToHead = .south
  switch directionToHead {
  case .north:
      print("Lots of planets have a north")
  case .south:
      print("Watch out for penguins")
  case .east:
      print("Where the sun rises")
  case .west:
      print("Where the skies are blue")
  }
  
  enum Barcode {
      case upc(Int, Int, Int, Int)
      case qrCode(String)
  }
  ```

Mutating

```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"
```

