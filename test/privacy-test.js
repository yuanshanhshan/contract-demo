const { ethers } = require("hardhat")

describe("Privacy", function () {
  it("Privacy", async function () {
    const Privacy = await ethers.getContractFactory("Privacy")
    var _data0 = await ethers.utils.formatBytes32String("_data0")
    var _data1 = await ethers.utils.formatBytes32String("_data1")
    var _data2 = await ethers.utils.formatBytes32String("_data2")
    const privacy = await Privacy.deploy([_data0, _data1, _data2])
    await privacy.deployed()

    const pw0 = await ethers.provider.getStorageAt(privacy.address, 0);
    const pw1 = await ethers.provider.getStorageAt(privacy.address, 1);
    const pw2 = await ethers.provider.getStorageAt(privacy.address, 2);
    const pw3 = await ethers.provider.getStorageAt(privacy.address, 3);
    const pw4 = await ethers.provider.getStorageAt(privacy.address, 4);
    const pw5 = await ethers.provider.getStorageAt(privacy.address, 5);

    console.log(pw5)
    const key = "0x" + pw5.slice(2, 34)
    console.log(key)
    await privacy.unlock(key)

  });
})

