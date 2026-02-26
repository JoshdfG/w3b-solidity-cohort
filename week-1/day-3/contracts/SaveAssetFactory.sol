// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./SaveAsset.sol";
import "./ERC20.sol";

contract SaveAssetFactory {
    address[] childContracts;

    function createChild(string memory _name, string memory _symbol, uint256 _totalSupply)
        external
        returns (address _erc20, address _savings)
    {
        ERC20 erc20 = new ERC20(_name, _symbol, _totalSupply);

        SaveAsset saveAsset = new SaveAsset(address(erc20));

        childContracts.push(address(saveAsset));

        return (address(erc20), address(saveAsset));
    }

    function getAllChildContract() external view returns (address[] memory) {
        return childContracts;
    }
}
