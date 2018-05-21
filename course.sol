pragma solidity ^0.4.23;

contract Owned
{
    address public owner;
    
    function Owned()
    {
        owner = msg.sender;
    }
    
    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }
}

contract Course is Owned
{
    string public title;
    string public description;
    string public instructor;
    uint public rating;
    
    struct Attendee {
        string country;
        string name;
    }
    
    mapping (address => Attendee) public Attendees;
    address[] public AttendeesAccts;
    
    event CourseInfo(string title,string description,string instructor,uint rating);
    event CourseRated(uint rating);
    event AttendeeInfo(string country,string name);
    
    
    //constructor
    function Course() {
        title = "Ethereum: Decentralized Application Development";
        description = "Learn to build Smart contracts in Solidity using multiple tools such as Web3/Truffle/JQuey";
        instructor = "Eduardo Santos";
        rating = 5;
        
        var newattendee1 = Attendees[0x281055Afc982d96fAB65b3a49cAc8b878184Cb16];
        newattendee1.country = 'Argentina';
        newattendee1.name = 'Lionel Messi';
        AttendeesAccts.push(0x281055Afc982d96fAB65b3a49cAc8b878184Cb16) -1;
        
        var newattendee2 = Attendees[0x6F46CF5569AEfA1acC1009290c8E043747172d89];
        newattendee2.country = 'Portugal';
        newattendee2.name = 'Cristiano Ronaldo';
        AttendeesAccts.push(0x6F46CF5569AEfA1acC1009290c8E043747172d89) -1;
        
        var newattendee3 = Attendees[0x90e63c3d53E0Ea496845b7a03ec7548B70014A91];
        newattendee3.country = 'Italy';
        newattendee3.name = 'Gianluigi Buffon';
        AttendeesAccts.push(0x90e63c3d53E0Ea496845b7a03ec7548B70014A91) -1;
        
    }
    
    
    //course related
    function UpdateCourse(string _title,string _description,string _instructor,uint _rating) public onlyOwner
    {
        title = _title;
        description= _description;
        instructor = _instructor;
        rating = _rating;
        CourseInfo(_title,_description,_instructor,_rating);
    }
    
     function RateCourse(uint _rating) public 
    {
        rating = _rating;
        CourseRated(_rating);
    }
    
    function getCourse() view public returns (string,string,string,uint) {
        return (title,description,instructor,rating  );
    }
    
    //attendee related
    function addAttendee(address _address,string _country,string _name) public
    {
        var newattendee = Attendees[_address];
        newattendee.country = _country;
        newattendee.name = _name;
        
        AttendeesAccts.push(_address) -1;
        
        AttendeeInfo(_country,_name);
    }
    
    function getAttendees() view public returns(address[])
    {
        return AttendeesAccts;
    }
    
    function getAttendee(address _address) view public returns (string,string) {
        return (Attendees[_address].country,Attendees[_address].name);
    }
    
    function countAttendees() view public returns(uint) 
    {
        return AttendeesAccts.length;
    }
    
    
}
