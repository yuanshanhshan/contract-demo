// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetFixedSupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";
contract FactoryNaiveAndClone {
    address public tokenAddress;
    function createToken(string calldata name, string calldata symbol, uint256 initialSupply) external returns (address) {
        ERC20PresetFixedSupplyUpgradeable token = new ERC20PresetFixedSupplyUpgradeable();
        token.initialize(name, symbol, initialSupply,msg.sender);
        tokenAddress = address(token);
        return address(token);
    }
    function createTokenByClone(string calldata name, string calldata symbol, uint256 initialSupply) external returns(address){
        address clone = ClonesUpgradeable.clone(tokenAddress);
        ERC20PresetFixedSupplyUpgradeable(clone).initialize(name, symbol, initialSupply,msg.sender);
        return clone;
    }
}