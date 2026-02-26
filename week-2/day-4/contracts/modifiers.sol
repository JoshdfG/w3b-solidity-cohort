// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract OurModifier {
    error NOT_THE_OWNER();
    string name;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert NOT_THE_OWNER();
        }
        _;
    }

    function setName(string memory _name) external onlyOwner {
        name = _name;
    }

    function getName() external view returns (string memory) {
        return name;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}

