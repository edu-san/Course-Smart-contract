pragma solidity ^0.4.18;

contract Course
{
    string name;
    uint age;
    
    function setInstructor(string _name,uint _age) public {
        name = _name;
        age = _age;
    }
    
    function getInstructor() public view returns(string,uint) {
        return (name,age);
    }
    
    
}
