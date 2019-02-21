const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile');

const provider = new HDWalletProvider(
    "calm invite job interest enemy cake horror drum hollow humor mechanic tonight",
    "https://rinkeby.infura.io/v3/60e0104a8f47427abe1c077cf2e37197"
);

const web3 = new Web3(provider);
const INITIAL_STRING = 'Hi there';

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log("accounts: ", accounts[0]);
    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({data: bytecode})
        .send({from: accounts[0], gas: '1000000'});

    console.log('Contract deployed to: ' + result.options.address);
};
deploy();