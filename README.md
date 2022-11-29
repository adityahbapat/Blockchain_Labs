Upload the zip files in remix.ethereum.org to view the contents in remix

Aditya Bapat <br/>
UID: 2019140007 <br/>
BE - IT <br/>
Sardar Patel Institute of Technology <br/>

## Lab 1
- Hello Solidity
- Counter program

## Lab 2
- Calculator
- Getters and Setters
- conditional (if-else)

## Lab 3
- View and Pure functions
- for, while loops
- Registration Dapp
- Average of numbers
- Age Calculator

## Lab 4
- attendance system
- profit loss checker
- grading system
- loop Sum

## Lab 5
- make your own cryptocurrency (open zeppelin and erc20 tokens used) and deploy it
    - configure your metamask and import your token by giving the contract address
    - send tokens from one account to another
## Lab 6
- Lottery System Dapp
    - After compiling deploy the contract (manager account)
    - transact 2 ether using 3 other acc
    - switch back to manager account
    - check balance (manager)
    - select winner
    - check account of winner (ether would be deposited to his account)

## lab 7
- Learning Ganache,Truffle (VS Code)
    - Credit Limit Program
    - npm install -g truffle, truffle vscode extension
    - download ganache (https://trufflesuite.com/ganache/)
    - inside truffle folder - ( truffle init || npx truffle init )
    - paste credit limit code inside contracts folder and do truffle compile
    - see json file in build folder
    - explore truffle-config.js


## lab 8
- Creating directly from OpenSea (ERC 1155)
    - Create Collection: https://testnets.opensea.io/collection/sporty-club
    - Upload Image and create NFT
    - NFT Link: https://testnets.opensea.io/assets/mumbai/0x2953399124f0cbb46d2cbacd8a89cf0599974963/14327623316663528033959644203702501411256809048170392790279868205446660620289

- Creating Own NFT
    - Upload Image and JSON file (Opensea Metadata Standards) on IPFS filebase bucket
    - Head to https://docs.openzeppelin.com/contracts/4.x/wizard and select ERC 721
    - choose option mintable, auto-increment-id, enumerable, uri storage
    - run code on remix and select metamask wallet
    - Deploy Contract (Polygon Matic faucets used)
    - in json put img link as - https://ipfs.io/ipfs/QmTYmNpSWtdvn5jnQMaPkdpgGDLhXGxThHxKP6DnttUYfW
    - last part of the link is the cid we get from filebase
    - in mint function after deployment enter our metamask address and uri(json file-https://ipfs.io/ipfs/QmbjadRHfNAVPnxdZbCZX6Z1XXHj5J7nM9dgvup8cBg1tY) and click transact
    - Ref link(https://www.section.io/engineering-education/how-to-deploy-an-nft-with-remix-ide-and-opensea/)
    - you can then change collection info from Opensea ui
    - nft link - https://testnets.opensea.io/assets/mumbai/0xad841928082603cd197f43ebbc645cd426ddba59/0

## lab 8
- Crowd Funding Dapp
    - Multiple events
    - acc to voting one event chosen who receives all the fund
    - During Deployment specify target and deadline(3600 = 1 hour) then deploy
    - Min contribution = 100 wei
    - enter your amount in wei in value input in remix and click sendEth to contribute


## lab 10
- Connect Frontend with Solidity