# 智能合约快速开发模板

> 用于智能合约项目能够在项目开发过程中少一些配置能够实现高效的开发效果。

## 添加内容

- 初始化项目

- 合并导入的合约到单独的文件中（sol-merger）

## TODO

- [ ] 


## 导入package使用

### Sol-merger
> Merges all imports into single file for solidity contracts
#### Cli Usage
- 安装
` npm install --save-dev sol-merger `
- package.json中添加执行脚本
``` js 
  {
  "scripts": {
    "build-contracts": "sol-merger \"./contracts/*.sol\" ./build"
  },
}
```

- 运行命令
` npm run build-contracts` 

---
