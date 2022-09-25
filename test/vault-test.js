const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Vault", function () {
  it("", async function () {
    const Vault = await ethers.getContractFactory("Vault")
    var password = await ethers.utils.formatBytes32String("test")
    console.log("password:", password)
    const vault = await Vault.deploy(password)
    await vault.deployed()

    console.log(vault.address)



    const pw = await ethers.provider.getStorageAt(vault.address, 1);

    console.log(pw)
    await vault.unlock(pw);



    console.log(await vault.locked())
  });
})