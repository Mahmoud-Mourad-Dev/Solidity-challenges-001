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




