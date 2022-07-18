// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.7 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BonusPools is AccessControlUpgradeable, UUPSUpgradeable {
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");
    bytes32 public constant OWNER_ROLE = keccak256("OWNER_ROLE");
    // disposit BEP/ECR20
    // userAddress -> tokenAddress -> amount
    mapping(address => mapping(address => uint256)) public balanceOf;

    function initialize() public initializer {
        __AccessControl_init();
        __UUPSUpgradeable_init();
        _grantRole(UPGRADER_ROLE, msg.sender);
        _grantRole(OWNER_ROLE, msg.sender);
    }

    function deposit(uint256 amount, address tokenAdd) external payable {
        balanceOf[msg.sender][tokenAdd] = msg.value;
    }

    function depositERC20(uint256 amount, address tokenAdd) external {
        IERC721Upgradeable(tokenAdd).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        balanceOf[msg.sender][tokenAdd] = amount;
    }

    function withdraw(uint256 amount) public view {}

    /*
     * Callback function used by VRF Coordinator
     */
    // The following functions are overrides required by Solidity.
    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyRole(UPGRADER_ROLE)
    {}
}
