// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract CoffeePoints {
    string public program = "Coffee";
    string public pointSymbol = "CFF";
    uint public totalPoints = 0; 

    // Mapping to keep track of each customer's points balance
    mapping(address => uint) public points;


    function earnPoints(address _customer, uint _cupsPurchased) public {
        // Ensure the customer buys at least one cup of coffee
        require(_cupsPurchased > 0, "Must purchase at least one cup of coffee");

        // Calculate points earned (10 points per cup purchased)
        uint earnedPoints = _cupsPurchased * 10;

        // Update total points issued and the customer's balance
        totalPoints += earnedPoints;
        points[_customer] += earnedPoints;

        // Assert that the total points issued are not less than the customer's balance
        assert(totalPoints >= points[_customer]);
    }

    
    function redeemPoints(address _customer, uint _pointsToRedeem) public {
        // Ensure the customer has enough points to redeem
        require(points[_customer] >= _pointsToRedeem, "Insufficient points to redeem");

        // Redeemable points must be in multiples of 50
        require(_pointsToRedeem % 50 == 0, "Points to redeem must be in multiples of 50");

        // Deduct redeemed points from the customer's balance and the total points issued
        points[_customer] -= _pointsToRedeem;
        totalPoints -= _pointsToRedeem;

        // Assert that the customer's balance does not go below zero
        assert(points[_customer] >= 0);
    }

   
    function transferPoints(address _to, uint _pointsToTransfer) public {
        // Ensure the sender has enough points to transfer
        require(points[msg.sender] >= _pointsToTransfer, "Insufficient points to transfer");

        // Deduct points from the sender's balance and add to the recipient's balance
        points[msg.sender] -= _pointsToTransfer;
        points[_to] += _pointsToTransfer;

        // Assert that the sender's balance does not go below zero
        assert(points[msg.sender] >= 0);
    }


    function checkBalance(address _customer) public view returns (uint) {
        return points[_customer];
    }
}
