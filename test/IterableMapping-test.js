const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Vault", function () {
  it("", async function () {
    const IterableMapping = await ethers.getContractFactory("IterableMapping")
    const iterableMapping = await IterableMapping.deploy()
    await iterableMapping.deployed()

    console.log(iterableMapping.address)

    const TestIterableMap = await ethers.getContractFactory("TestIterableMap", {
      libraries: {
        IterableMapping: iterableMapping.address,
      }

    })
    const testIterableMap = await TestIterableMap.deploy()
    await testIterableMap.deployed()

    console.log(testIterableMap.address)
  });
})