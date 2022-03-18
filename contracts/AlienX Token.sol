// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AlienX is ERC20 {
     mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    uint256 public AlienXPerEth = 1000;

    constructor() ERC20("AlienX", "ALX") {
        _mint(msg.sender, 1000000);
    }
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }
    function buyToken(address receiver) public payable{   
        uint256 amount = (msg.value * AlienXPerEth) / 10**decimals();
        _mint(receiver, amount);
    }
    function balanceOf(address receiver) public view virtual override returns (uint256) {
        return _balances[receiver];
    }
    
      function _mint(address account, uint256 amount) internal virtual override {
        _totalSupply += amount;
        _balances[account] += amount;
    }

}