const { ethers } = require("hardhat");

async function main() {
  const myContract = await ethers.getContractFactory("myerc20"); // fetch contract
  const token = await myContract.deploy(); // send contract for deployment

  const deployedCon = await token.waitForDeployment(); // get confirmation when tx has been mine and contract is live on network

  console.log(`Deployed the erc20 token at ${token.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
