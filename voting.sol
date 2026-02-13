// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;
    bool public electionActive;

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public admins;
    mapping(address => bool) public registeredVoters;
    mapping(address => bool) public hasVoted;

    Candidate[] public candidates;

    modifier onlyOwnerOrAdmin() {
        require(
            msg.sender == owner || admins[msg.sender],
            "Not authorized"
        );
        _;
    }


    modifier electionIsActive() {
        require(electionActive, "Election is not active");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Owner assigns admin
    function addAdmin(address _admin) public {
        require(msg.sender == owner, "Only owner can add admin");
        admins[_admin] = true;
    }

    // Add candidate
    function addCandidate(string memory _name) public onlyOwnerOrAdmin {
        candidates.push(Candidate(_name, 0));
    }

    // Register voter
    function registerVoter(address _voter) public onlyOwnerOrAdmin {
        registeredVoters[_voter] = true;
    }

    // Start election
    function startElection() public onlyOwnerOrAdmin {
        electionActive = true;
    }

    // End election
    function endElection() public onlyOwnerOrAdmin {
        electionActive = false;
    }

    // Vote
    function vote(uint256 _candidateIndex)
        public
        electionIsActive
    {
        require(registeredVoters[msg.sender], "Not registered to vote");
        require(!hasVoted[msg.sender], "Already voted");
        require(_candidateIndex < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount += 1;
    }

    // View total candidates
    function getCandidatesCount() public view returns (uint256) {
        return candidates.length;
    }
}
