// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract OneWayFinder{
    uint reward;
    bytes32 ownerHash;
    address ownerAddress;

    constructor(bytes32 _ownerHash) payable {
        require(msg.value == 5 ether);
        reward = 5 ether;
        ownerHash = _ownerHash;
    }

    function hash(uint value) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(value));
    }

    function reveal(uint value) public {
        require(reward > 0 ether);
        require(msg.sender != ownerAddress);
        require(hash(value) == ownerHash);

        payable(msg.sender).transfer(reward);
        reward = 0;
    }
}