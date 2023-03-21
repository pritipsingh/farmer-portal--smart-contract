require('dotenv').config()
require("@nomicfoundation/hardhat-toolbox");


/** @type import('hardhat/config').HardhatUserConfig */

const ALCHEMY_MUMBAI_URL = process.env.ALCHEMY_MUMBAI_URL
const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY


module.exports = {
  solidity: "0.8.9",
  defaultNetwork: "hardhat",
  networks: {
    polygon_mumbai: {
      url: ALCHEMY_MUMBAI_URL ,
      accounts: [ACCOUNT_PRIVATE_KEY],
    }
  }
};