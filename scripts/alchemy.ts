// Imports the Alchemy SDK
import { Alchemy, Network } from 'alchemy-sdk'

// Configures the Alchemy SDK
const config = {
  apiKey: 'VLW--9gkOt3wyQLcSUDXcEQKTAgkw7nj', // Replace with your API key
  network: Network.MATIC_MUMBAI, // Replace with your network
}

// Creates an Alchemy object instance with the config to use for making requests
const alchemy = new Alchemy(config)

const main = async () => {
  // define the contract address and token Id w
  const address = '0x721e79171411B62d2940fa1AA38843700c07A65B'
  const tokenId = '1'

  //Call the method to fetch the owners for the collection
  const response = await alchemy.nft.getOwnersForNft(address, tokenId)

  //Logging the response to the console
  console.log(JSON.stringify(response))
}

;(async () => {
  await main()
})()
