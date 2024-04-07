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
