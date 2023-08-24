pragma solidity^0.8.17;
 
contract CallMe {
 
    uint256 public var1 = 1;
    uint256 public var2 = 2;
 
 
    function a(uint256 _var1, uint256 _var2) external payable returns(uint256, uint256) {
 
        // requires 1 ether was sent to contract
        require(msg.value >= 1 ether);
 
        // updates var1 & var2
        var1 = _var1;
        var2 = _var2;
 
        // returns var1 & var2
        return (var1, var2);
       
    }
 
 
    function b() external view returns(uint256, uint256) {
        return (var1, var2);
    }
 
}
