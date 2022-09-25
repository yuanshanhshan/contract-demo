const { ethers } = require("hardhat")

describe("Vault", function () {
  it("King Attack", async function () {
    const King = await ethers.getContractFactory("King")
    const king = await King.deploy({ value: 10000 })
    await king.deployed()

    // get contract balance
    console.log(await ethers.provider.getBalance(king.address))


    // deploy attackKing
    const AttackKing = await ethers.getContractFactory("AttackKing")
    const attackKing = await AttackKing.deploy(king.address)
    await attackKing.deployed()

  });
})