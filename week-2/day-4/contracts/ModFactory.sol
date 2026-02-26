// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./modifiers.sol";

contract ModFactory {
    address[] childInstances;

    function createChild() external {
        OurModifier ourModifier = new OurModifier();
        childInstances.push(address(ourModifier));
    }
}
