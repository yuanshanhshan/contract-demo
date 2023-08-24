const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('AssemblyTest', function () {
  it('', async function () {
    const AssemblyTestFactory = await ethers.getContractFactory('AssemblyTest')
    const assemblyTest = await AssemblyTestFactory.deploy()
    await assemblyTest.deployed()

    const res = await assemblyTest.readAndWriteToStorage()

    // 获取slot 4

    console.log(await assemblyTest.getValInHex(4))

    await assemblyTest.writeVar5(4)

    console.log(await assemblyTest.getValInHex(3))
  })
})
