// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // public variables 
    string public tokenName = "Axiel";
    string public tokenAbbrv = "AXE";
    uint public totalSupply = 0;

    // mapping variable 
    mapping(address => uint) public balances;

    // mint function
    function mint(address _address, uint _value) public {
        // Ensure mint value is greater than zero
        require(_value > 0, "Mint value must be greater than zero");

        totalSupply += _value;
        balances[_address] += _value;

        // Assert total supply should not be less than the balance
        assert(totalSupply >= balances[_address]);
    }

    // burn function
    function burn(address _address, uint _value) public {
        // Check if the address has enough balance to burn
        require(balances[_address] >= _value, "Insufficient balance to burn");

        // Decrease the total supply and the balance of the sender
        totalSupply -= _value;
        balances[_address] -= _value;

        // Assert that balance cannot go negative
        assert(balances[_address] >= 0);

        // Revert if the total supply goes negative
        if (totalSupply < 0) {
            revert("Total supply cannot be negative");
        }
    }
}
