// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Owned.sol";

contract TokenClaim is Owned {
    IERC20 public tokenHZN;
    IERC20 public tokenzUSD;
    address public spender;

    constructor(
        address _tokenHZN,
        address _tokenzUSD,
        address _spender,
        address _owner
    ) Owned(_owner) {
        tokenHZN = IERC20(_tokenHZN);
        tokenzUSD = IERC20(_tokenzUSD);
        spender = _spender;
    }

    function claimHZN(uint256 _amount) external {
        require(_amount <= 1000 * 1e18, "Transfer amount too large.");
        tokenHZN.transferFrom(spender, msg.sender, _amount);
    }

    function claimzUSD(uint256 _amount) external {
        require(_amount <= 500 * 1e18, "Transfer amount too large.");
        tokenzUSD.transferFrom(spender, msg.sender, _amount);
    }
}
