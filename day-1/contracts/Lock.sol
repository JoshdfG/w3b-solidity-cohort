// SPDX-License-Identifiee: UNLICENSED
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    // value types
    // bool keyword;
    // int256 time;
    // uint256 age;
    // address owner;
    // bytes1 by;
    // enum status {
    //     Online,
    //     onsite
    // }
    //
    // // reference types
    // int256[] students;
    //
    // struct Users {
    //     uint8 id;
    // }
    // mapping(uint8 => Users) identifier;
    // string your_name_here;

    string name;

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }
}
