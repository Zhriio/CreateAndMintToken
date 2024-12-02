// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract DripToken is ERC20 {
    
    address public owner;

    constructor() ERC20("DripToken","DPC") {
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Minting is only accessible for the owner.");
        _mint(to, amount);
    }

    function transferToken(address recipient, uint256 amount) external returns (bool) {
        require(balanceOf(recipient)>= amount,"Insufficient amount to transer.");
        return transfer(recipient, amount);
    }

    function burnToken( uint256 amount) public {
        require(balanceOf(msg.sender)>= amount,"Insufficient amount to burn.");
        _burn(msg.sender, amount);
    }
}
