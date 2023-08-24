// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.7 <0.9.0;

import "hardhat/console.sol";

contract AssemblyTest {

  // slot 0
uint256 var1 = 256;

// slot 1
address var2 = 0x9ACc1d6Aa9b846083E8a497A661853aaE07F0F00;

// slot 2
bytes32 var3 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

// slot 3
uint128 var4 = 1;
uint128 var5 = 2;

// slot 4 & 5
uint128[4] var6 = [0, 1, 2, 3];
// 0x0000000000000000000000000000000100000000000000000000000000000000
// 0x0000000000000000000000000000000300000000000000000000000000000002

// slot 6 
uint256[] var7;


// slot 7
mapping(uint256 => uint256) var8;


// slot 8
mapping(uint256 => mapping(uint256 => uint256)) var9;


// 结构体 和固定长度数组是一样的
struct Var10 {
  uint256 subVar1;
  uint256 subVar2;
}


  /**
   * @dev 变量赋值、运算和评估
   * 我们需要讨论的第一个话题是简单的操作。Yul有+，-，*，/，%，**，<，>，和=。注意，>=和<=不包括在内，Yul没有这些操作。此外，评估不是等于真或假，而是分别等于1或0。
   */
 
  function addOneAndTwo() external pure returns(uint256) {
     uint256 ans; // 函数内声明
      assembly {
        let one := 1
        let two := 2

        ans := add(one, two)
      }
      return ans;
  }

  /**
   * For 循环和 If 语句
   */

  function howManyEvents(uint256 startNum, uint256 endNum) external pure returns(uint256) {
    uint256 ans;
    assembly {
      for {let i := startNum } lt(i, add(endNum, 1)) { i:= add(i, 1)} {
        if iszero(i) {
          continue
        }

        if eq( mod(i, 2), 0 ) {
          ans := add(ans, 1)
        }
      }
    }

    return ans;
  }


  /**
   * 存储
   */

  function readAndWriteToStorage() external returns (uint256, uint256, uint256) {
    uint256 x;
    uint256 y;
    uint256 z;

    assembly {
      // 获取var5的槽位
      let slot := var5.slot

      // 获取var5的槽位偏移
      let offset := var5.offset

      // 赋值给 solidity 中的变量
      x := slot
      y := offset

      // 在槽0上保存 1
      sstore(0, 1)

      // 加载槽位 0 的值赋值给z
      z := sload(0)
    }
    console.log(x, y, z);
    return (x, y, z);
    // 3, 16, 1
  }

  function getValInHex(uint256 y) external view returns( bytes32) {
    bytes32 x ;
    assembly {
      x := sload(y)
    }

    return x;
  }

  /**
   * 获取动态数组的值
   */
  function getValFromDynamicArray(uint256 targetIndex) external view returns (uint256 ) {
    uint256 slot;
    assembly {
      slot := var7.slot
    }

    bytes32 startIndex = keccak256(abi.encode(slot));

    uint256 ans;
    assembly {
      ans := sload(add(startIndex, targetIndex))
    }

    return ans;
  }

  /**
   * maping : 类似于动态数组，只是我们将槽和键一起散列
   */

  function getMappedValue(uint256 key) external view returns(uint256) {
    uint256 slot;

    assembly {
      slot := var8.slot
    }

    bytes32 location = keccak256(abi.encode(key, slot));

    uint256 ans;

    assembly {
      ans := sload(location)
    }

    return ans;
  }

  /**
   * mapping 多层嵌套
   */

  function getMuitMappedValue(uint256 key1, uint256 key2) external view returns( uint256 ) {
    uint256 slot;
    assembly {
      slot := var9.slot
    }

    bytes32 localtionOfParentVaule = keccak256(abi.encode(key1, key2));

    bytes32 localOfNestedValue = keccak256(abi.encode(key2, localtionOfParentVaule));

    uint256 ans;

    assembly {
      ans := sload(localOfNestedValue)
    }
    return ans;
  }

  function writeVar5(uint256 newVal) external {
    assembly {
      sstore(3, newVal)
    }
  }


  /**
   * 内存
   */

/**
 * struct
 *  s.subVar1设置为内存位置0x80 - 0xa0
 *  s.subVar2设置为内存位置0xa0 - 0xc0
 */
  function getStructValue() external pure returns(uint256, uint256){
    // 初始化struct
    Var10 memory s;
    s.subVar1 = 32;
    s.subVar2 = 64;

    assembly {
      return(0x80, 0xc0)
    }  
  }   

  /**
   * 动态数组中添加值
   */

  function getDynamicArrayValue(uint256[] memory arr) external pure returns(uint256[] memory) {
    assembly {
      let location := arr

      let length := mload(arr)

      let nextMemoryLocation := add(add(location,0x20),mul(length, 0x20))

      mstore(nextMemoryLocation,4)

      length := add(length, 1)

      mstore(location, length)

      mstore(0x40, 0x140)

      return( add(location,0x20),mul(length, 0x20))

    }
  }


  /**
   * 合约调用
   */

}