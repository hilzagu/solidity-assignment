// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Abstract contract
contract Mammal{
    uint256 public age;
    bool canBreathe = true;
    bool hasBlood = true; 

    
    
    function Grow () public view virtual returns (uint256){
        return age;
    }

    function Die () public virtual returns (bool) { 
        canBreathe = false;
        return canBreathe;
    }

    function Sound () public view virtual returns (string memory){
         return 'Animal sound';
    }   
}   
    
//child contract: DOG

contract Dog is Mammal {

    function Sound () public pure override returns (string memory){
        return 'Bark';
    }

    function Bark() public pure returns (string memory){
        return 'woof';
    }
    
    function fetch() public pure returns (string memory) {
        return "Dog is fetching the ball";
    }
}

//child contract: DOG

contract Monkey is Mammal {

    function Sound () public pure override returns (string memory){
        return 'Screeh';
    }

    function Eat() public pure returns (string memory){
        return "Monkey is eating a banana";
    }
}
