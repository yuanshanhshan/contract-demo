# 智能合约快速开发模板

> 用于智能合约项目能够在项目开发过程中少一些配置能够实现高效的开发效果。

## 添加内容

- 初始化项目

- 合并导入的合约到单独的文件中（sol-merger）
- Ethernaut
- 合约发布时候引入 library（js 发布合约）
- 测试代码中捕捉 Event

## TODO

- [ ]

## 导入 package 使用

### Sol-merger

> Merges all imports into single file for solidity contracts

#### Cli Usage

- 安装
  `npm install --save-dev sol-merger`
- package.json 中添加执行脚本

```js
  {
  "scripts": {
    "build-contracts": "sol-merger \"./contracts/*.sol\" ./build"
  },
}
```

- 运行命令
  ` npm run build-contracts`

---

## Ethernaut

### Vault

> EVM 中 storage 中的数据存储方式是通过 Slot 实现的

private 声明的变量可以通过数据在 slot 中存储的位置进行查询

```js
// password is at storage slot 1
const password = await eoa.provider.getStorageAt(challenge.address, 1)
console.log(`password = ${password} "${Buffer.from(password.slice(2), `hex`)}"`)
```

## 发布合约的时候引入 library

```javascript
 ......

 const contractFactory = await ethers.getContractFactory("SampleNft", {
      signer: signers[0],
      libraries: {
        TokenTrait: lib.address,
      },
    });

......
```

## 参考链接

https://hardhat.org/hardhat-chai-matchers/docs/overview
