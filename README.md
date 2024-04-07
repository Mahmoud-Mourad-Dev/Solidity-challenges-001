# Solidity-challenges-001
## - This solidity challenge from calyptus
### What will the "y" public variable from contract B return ? can you gues why?
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract A {
    uint immutable x;
     constructor(){
        x=42;
     }
     function f() internal view returns(uint256){
        return x;
     }
}

     contract B is A{
        uint public y = f();
     }




```
# Resolve 
![1- first time i ask myself Question Can i call internal function f() from contract B which inherit from contract A](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/71e2aa97-a9af-4da7-8a09-71be5bf04340)

## I ask Ai Yes we can call  internal function f() in contract B which inherit from contract A 
## In Solidity, an internal function is accessible only within the contract in which it is defined and by contracts that inherit from it
## I try to compile code in remix -It is ok- i changed function f() visibility from intenal to public and try to compile ERROR
```solidity

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract A {
    uint immutable x;
     constructor(){
        x=42;
     }
     function f() private view returns(uint256){
        return x;
     }
}

     contract B is A{
        uint public y = f();
     }
// Error to compile 



```
![I ask another Question What is Different between Private and Internal visibility ](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/0b5a712d-e230-42a4-aa94-51fbacf75dd7)

![Contract Visibility](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/02bdd613-61d6-433b-bd13-9f421abfa874)

## I think Y value return 42 same value of Function F()
## But when i try code in remix Y value return 0 
```solidity

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract A {
    uint immutable x;
     constructor(){
        x=42;
     }
     function f() internal view returns(uint256){
        return x;
     }
}

     contract B is A{
        uint public y = f();
     } 
     // Y output = 0

```
## I change F() visibility to public to see F() function value

```solidity

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract A {
    uint immutable x;
     constructor(){
        x=42;
     }
     function f() public view returns(uint256){
        return x;
     }
}

     contract B is A{
        uint public y = f();
     } 
     // F() value =42
```
![Why Y not same F() value which inherit from contract A](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/c42e1d3f-c651-4447-86ed-9e1017cc53c2)

# Solution
## Understanding Initialization and Constructor Execution
### 1-Variable Initialization: In Solidity, state variables can be initialized directly in their declaration. 
### 2-This happens before any constructor code runs. 
### 3-These initializations are part of the contract's bytecode and executed as part of the contract's creation,
### 4-immediately before the constructor code is executed.
## Constructor Execution:
### 1-Constructors are executed after all the state variable initializations have taken place,
### 2-and in the context of inheritance, base contract constructors are executed before derived contract constructors.

![Why y is 0](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/2b6eaba1-6642-4666-bef4-62d3418d3be4)

## what happens in your contracts A and B is as follows:
### 1-When contract B is deployed, the Solidity runtime first initializes state variables,including y. 
### 2-At this point, it attempts to set y to the return value of f().
### 3-However, this initialization of y happens before any constructor is executed.
### 4-This means it occurs before the constructor of A has a chance to run and initialize x with 42.
### 5-The function f() is called to initialize y before x is set.
### 6-Since x is an immutable variable and must be initialized in the constructor, it hasn't been assigned yet, 
### 7-effectively making it 0 (the default value for uninitialized uint variables) at the time f() is called.
### 8-As a result, f() returns 0, and y is initialized with this value.
![Fixed Code](https://github.com/Mahmoud-Mourad-Dev/Solidity-challenges-001/assets/35864731/6e059a65-22a3-48d3-9888-9181812e023d)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint immutable x;

    constructor() {
        x = 42;
    }

    function f() internal view returns(uint256) {
        return x;
    }
}

contract B is A {
    uint public y;

    constructor() {
        y = f(); // This ensures `x` is initialized before `f()` is called.
    }
}
// Y output value =42
```

[@Mourad_Dev Follow
](https://twitter.com/Mourad_Dev)







