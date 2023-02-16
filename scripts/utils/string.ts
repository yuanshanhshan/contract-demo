import { ethers, keccak256, toUtf8Bytes } from 'ethers'
/**
 *
 * @param str
 * @returns 合约中的keccak256(string)
 */
async function string2Keccak256Bytes32(str: string): Promise<string> {
  return keccak256(toUtf8Bytes(str))
}

;(async function () {
  const vaultRoleBytes = await string2Keccak256Bytes32('VAULT_ROLE')
  console.log(`${vaultRoleBytes}`)
})()
