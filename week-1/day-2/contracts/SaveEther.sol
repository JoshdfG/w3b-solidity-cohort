// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SaveEther {
    mapping(address => uint256) public balances;

    event DepositSuccessful(address indexed sender, uint256 indexed amount);

    event WithdrawalSuccessful(address indexed receiver, uint256 indexed amount, bytes data);

    function deposit() external payable {
        // require(msg.sender != address(0), "Address zero detected");
        require(msg.value > 0, "Can't deposit zero value");

        balances[msg.sender] = balances[msg.sender] + msg.value;

        emit DepositSuccessful(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender != address(0), "Address zero detected");

        // the balance mapping is a key to value pair, if the key is
        // provided it retuns the value at that location.
        //
        uint256 userSavings_ = balances[msg.sender];

        require(userSavings_ > 0, "Insufficient funds");

        require(_amount <= userSavings_, "You didn't save that much!!!");

        balances[msg.sender] = userSavings_ - _amount;

        // (bool result,) = msg.sender.call{value: msg.value}("");
        (bool result, bytes memory data) = payable(msg.sender).call{value: _amount}("");

        require(result, "transfer failed");

        emit WithdrawalSuccessful(msg.sender, _amount, data);
    }

    function getUserSavings() external view returns (uint256) {
        return balances[msg.sender];
    }

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
    fallback() external {}
}
