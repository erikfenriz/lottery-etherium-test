pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);

        players.push(msg.sender);
    }

    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }
}



//pragma solidity >=0.4.22 <0.6.0;
//
//contract Lottery {
//
//    address public manager;
//    address payable[] public players;
//
//    constructor() public {
//        manager = msg.sender;
//    }
//
//    function enter() public payable {
//        require(msg.value > .01 ether);
//
//        players.push(msg.sender);
//    }
//
//    function random() private view returns (uint256) {
//        return uint256(keccak256(abi.encodePacked(block.difficulty, now, players)));
//    }
//
//    function pickWinner() public payable restricted {
//        uint index = random() % players.length;
//        players[index].transfer(address(this).balance);
//        players = new address payable[](0);
//    }
//
//    modifier restricted(){
//        require(msg.sender == manager);
//        _;
//    }
//
//    function getPlayers() public view returns (address payable[] memory) {
//        return players;
//    }
//}