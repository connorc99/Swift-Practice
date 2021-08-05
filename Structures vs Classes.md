### Structures vs Classes

- Structures are preferred
- Structs are value typed, classes are reference types

```swift
struct Person {
  var name:String
  var age:Int 
  var weight:Double
}

var personA = Person(name:"Connor", age:21, weight:183.3)
personB = personA

print(personA.name) //prints Connor
print(personB.name) //prints Connor

personB.name = "Bean Harder"
print(personA.name) //prints Connor
print(personB.name) //prints Bean Harder
```

