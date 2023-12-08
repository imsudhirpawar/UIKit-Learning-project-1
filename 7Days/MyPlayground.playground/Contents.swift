import UIKit

/**
 
 Day 1 -
 
 Basics of swift, Var, let, lazy,computed property, function, Struct


 */


var printString = "Hello, World!";
print(printString)

//variable name shouldm't start with number

var num:Int
let name: String
var characterString: Character
var double: Double
let float: Float
var bool: Bool

num = 23
name = "Sudhir"

print(num, name, separator: " - ", terminator: "\n\n\n")


/**
 
 Optionals
 
 */


class Numbers{
    
    let number = Int.random(in: 0...500)
    let constantNumber = 20
    
}

let number: Numbers? = Numbers()
//let number: Numbers? = nil

print("Type of number variable - \(type(of: number))")



/**
 
 lets take an example of optional
 
 we have created a constant called number which is an instance of Numbers class but its optional meaning it can content the instance as well as null
 
 lets unwrap number to get values in it
 
 we have 4 ways to unwrap optionals
 
 Force unwrap, optional binding, optional chaining, nil coalescing operator
 
 */


// 1. Force Unwrapping

let forceUnwrappedObj = number!

print("Force Unwrapped value - \(forceUnwrappedObj.constantNumber)")

//this will lead to an error if optional is nil : Unexpectedly found nil while unwrapping an Optional value


// 2. Optional Binding

if let obj = number {
    print("Unwrapped throgh Optional Binding - \(obj.constantNumber)")
}

// 3. Nil Coalescing Operator

let defaultValue = 12

let someValue:Numbers? = Numbers()

print("Unwrapped throgh Nil Coalescing Operator \(someValue?.constantNumber ?? defaultValue )")


// 4. Optional Chaining

let constNum = number?.constantNumber
print("Unwrapped throgh Optioanl Chaining \(String(describing: constNum))", terminator: "\n\n\n")



// LAZY Property & Computed Property

class Lazy{
    
    
    lazy var lazyString:String = {
        print("Lazy Var a Initialized")
        return "I am Lazy"
    }()
    
    
    var nonLazyString:String = "I am Non-Lazy"
    
    
    
    
   
    
}

let example = Lazy()

print(example.lazyString)
print(example.nonLazyString)
let nonLazyString = example.lazyString

print(nonLazyString, terminator: "\n\n")


struct Computed{
    
    var string:String = "defaultString"
    
    var computedProperty_withoutSetter: String {
        return "I am computedProperty"
    }
    
    
    
    var computedProperty_withSetter: String {
        
        get{
            return string
        }
        
        set(newValue){
          string = newValue
        }
        
    }
    
    
}

var comp = Computed()


print(comp.computedProperty_withoutSetter)
print(comp.computedProperty_withSetter)

comp.computedProperty_withSetter = "UpdatedString"

print(comp.computedProperty_withSetter)


//Struct and Class


/* Struct vs Class in swift
 Inheritance:
                            Classes support inheritance, which means that one class can inherit properties and methods from another class. Structs do not support inheritance.
Reference vs value types:
                            Classes are reference types, which means that when you assign an instance of a class to a new variable or constant, both variables will reference the same instance in memory. Structs, on the other hand, are value types, which means that when you assign an instance of a struct to a new variable or constant, a new copy of the struct is created.
*/



/*
 
 
1. Class methods:

        - They are declared with the class keyword in the method signature.
        - They can be overridden by subclasses.
        - Do not need to create instance to call a Class method

2. Static methods:

        - They are declared with the static keyword in the method signature.
        - They cannot be overridden by subclasses.
        - Do not need to create instance to call a static method


3. Final methods:

        - They are declared with the final keyword in the method signature.
        - They cannot be overridden by subclasses.
        - Need to create instance to call a final method

 */







// Day 2

/* Protocol

In Swift, a protocol is a blueprint or a set of rules that defines a set of methods, properties, or other requirements that a conforming type must provide. It is similar to an interface in other programming languages.

A protocol is declared using the `protocol` keyword followed by its name and the set of requirements it defines.

*/



struct StoredProperties{
  var stored: String = "Stored Property"

  //lazy

  lazy var lazyVar = "Lazy Variable"

  // property observer

  var observer: String  {
    willSet{
      print("willset is called")
      print(newValue)
      print(observer)
    }
    didSet{
      print("didset is called")
      print(oldValue)
      print(observer)
      
    }
  }
}

var st = StoredProperties(observer: "Sudhir")
print("Now assigning another value to property obeserver")
st.observer = "S"











