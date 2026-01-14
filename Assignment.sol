// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Assignment{

    //Variable that stores a positive number
    uint256 public variable = 5;

    // Function that modifies the value of the variable
    function modify(uint _variable) public {
        variable = _variable;
    }
    // Function thay returns the variable
    function getNum() public view returns (uint256){
        return variable;
    }

     /* -------------------------------------------------- */
    /* PART 2: TODO-LIST                             */
    /* -------------------------------------------------- */
     
     // struct definition
     struct Todo {
        string activity; // Description of the task
        bool completed; // Whether task is done (true or false)
    }

    // Storage for Todo List

    Todo[] private todos;

    // function adds a New Activity
    function addTodo(string memory _activity) public {
        todos.push(Todo(_activity, false));
    }


    // funtions views the to do list
    function getTodos() public view returns (Todo[] memory) {
        return todos;
    }

    //funtions marks task as completed
    function markCompleted(uint256 _index) public {
        require(_index < todos.length, "Invalid todo index");
        todos[_index].completed = true;
    }

    /* -------------------------------------------------- */
    /* PART 3: Difference between Struct and Mapping                       */
    /* -------------------------------------------------- */

    //STRUCT: groups related data together.
    // example below

    struct Person {
    string name;
    uint age;
    address walletAddress;
    uint256 balance;
    bool isStudent;
    
    // characteristics:
    //Holds multiple data types
    //Represents a real-world object
    //Cannot search directly
    //Needs array or mapping to store multiple items

    }
     //MAPPING: stores keys to values.
    // example below
    mapping(address => uint256) public balances; // Maps an address to a balance

    //Characteristics:
    //Very fast lookup
    //No looping required
    //Cannot iterate
    //No length
    //Keys must be unique
}
