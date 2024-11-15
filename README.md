# CoffeePoints Smart Contract

## Description  
A Solidity-based rewards system designed to simulate a real-world loyalty program. This program allows users to earn points by purchasing coffee, redeem points for rewards, and transfer points to others. It implements Solidity's `require()`, `assert()`, and `revert()` statements to ensure the integrity and reliability of transactions.

## Key Features  

### Program Information  
- The contract publicly stores details about the rewards program name, point symbol, and the total points issued.

### **Earning Points**  
- Customers earn 10 points for every coffee cup purchased.
- Points are assigned to the customer's address, and the total points issued are updated.
- Ensures that the number of coffee cups purchased is positive.

### **Redeeming Points**  
- Customers can redeem their points in multiples of 50 for rewards.  
- Reduces both the customer's balance and the total points issued.  
- Checks ensure the customer has enough points and prevents unauthorized redemptions.  

### **Transferring Points**  
- Customers can transfer their points to another user.  
- Deducts points from the sender’s balance and adds them to the recipient’s balance.  
- Ensures that the sender has sufficient points before completing the transfer.  

### **Balance Check**  
- Provides an easy way to check the points balance of any customer by their address.  

## Resources Used  
- **Remix IDE**: For coding, testing, and deploying the Solidity contract.  

## Authors  
**Aciel07**  
