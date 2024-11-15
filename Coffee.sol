// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract CoffeePoints {
    string public pointName = "Coffee";
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
        require(points[msg.sender] >= _pointsToTransfer, "Insufficient points to transfer");

        points[_to] += _pointsToTransfer; // Add points to recipient
        totalPoints -= _pointsToTransfer; // Deduct transferred points from total supply

        // Ensure sender's points don't go negative
        assert(points[msg.sender] >= 0);
    }

}
