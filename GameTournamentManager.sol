// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GameTournamentManager {
    address public owner;
    uint256 public tournamentId;

    struct Tournament {
        string name;
        uint256 entryFee;
        address[] players;
        address winner;
        bool isActive;
    }
    mapping(uint256 => Tournament) public tournaments;

    constructor() {
        owner = msg.sender;
        tournamentId = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    function createTournament(
        string memory _name,
        uint256 _entryFee
    ) public onlyOwner {
        Tournament storage t = tournaments[tournamentId];
        t.name = _name;
        t.entryFee = _entryFee;
        t.isActive = true;
        tournamentId++;
    }

    function register(uint256 _id) public payable {
        Tournament storage t = tournaments[_id];
        require(t.isActive, "Tournament is not active");
        require(msg.value == t.entryFee, "Incorrect entry fee");

        t.players.push(msg.sender);
    }

    function endTournament(uint256 _id, address _winner) public onlyOwner {
        Tournament storage t = tournaments[_id];
        require(t.isActive, "Tournament already ended");
        require(_winner != address(0), "Winner can't be zero address");

        t.isActive = false;
        t.winner = _winner;

        uint256 totalPrize = t.entryFee * t.players.length;
        payable(_winner).transfer(totalPrize);
    }

    function getPlayers(uint256 _id) public view returns (address[] memory) {
        return tournaments[_id].players;
    }
}
