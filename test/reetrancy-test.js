const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('Vault', function () {
  it('', async function () {
    const Reetrancy = await ethers.getContractFactory('Reentrance')
    const reetrancy = await Reetrancy.deploy()
    await reetrancy.deployed()
    let value = await ethers.utils.parseEther('10')
    await reetrancy.donate(reetrancy.address, { value: value })
  })
})
