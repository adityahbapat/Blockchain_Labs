//SPDX-License-Identifier:MIT
// Aditya Bapat 
// BE IT 2019140007

pragma solidity >=0.7.0 <0.9.0;

contract crowdFunding {
    address public manager;
    uint public minimumContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public noOfContributors;
    // address of contributor mapped with his contribution
    mapping(address=>uint) public contributors;

    // request stands for events registered for crowdfunding
    // eg: blanket giving, food giving etc
    // after voting is done event with max votes gets all the money

    struct Request {
        // desc of event
        string description;
        address payable recipient;
        uint value;
        // check if voting is completed
        bool completed;
        uint noOfVoters;
        // each voter can vote only once
        mapping(address=>bool) voters;
    }

    mapping(uint=>Request) public requests;
    uint public numRequests;


    constructor(uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline; //(curr time + 3600 (60 * 60)) 1 hour
        minimumContribution = 100 wei;
        manager = msg.sender;
    }

    modifier onlyManager(){
        require(msg.sender == manager,"Only Manager can call this function!");
        _;
    }

    // here function is payable because money going inside contract balance (contract account)
    function sendEth() public payable {
        require(block.timestamp < deadline,"Deadline has passed");
        require(msg.value > minimumContribution,"Minimum contribution not met");
        // check if particular contributor has contributed early or not
        if(contributors[msg.sender] == 0){
            // if not contributed increment unique contributors count
            noOfContributors++;
        }
        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    // creation of events
    function createRequests(string memory _description, address payable _recipient, uint _value) public onlyManager{
        // cannot use memory with struct, can use storage
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.noOfVoters = 0;
    }

    function voteRequest(uint _requestNo) public{
        require(contributors[msg.sender] > 0,"You must be contributor");
        Request storage thisRequest = requests[_requestNo];
        // if thisRequest.voters[msg.sender] = true means contributor has voted
        require(thisRequest.voters[msg.sender] == false,"You have already voted");
        thisRequest.voters[msg.sender] = true;
        thisRequest.completed = true;
    }

    function makePayment(uint _requestNo) public onlyManager{
        require(raisedAmount >= target);
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.completed == false,"The Request has been completed");
        require(thisRequest.noOfVoters > noOfContributors/2,"Majority does not support");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed = true;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    // here refund function is not payable, address is payable
    function refund() public {
        require(block.timestamp > deadline && raisedAmount < target, "You are not eligible for refund");
        require(contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;
    }
}