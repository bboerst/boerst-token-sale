pragma solidity ^0.5.0;

import "./BoerstToken.sol";

contract BoerstTokenSale {
    address admin;
    BoerstToken public tokenContract;
    uint256 public tokenPrice;

    constructor (BoerstToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}