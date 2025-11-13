pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 favouriteNumber;

    struct Person {
        uint256 favNumber;
        string name;
    } 
    Person public person1 = Person(7 , "Bob");

    Person[] list_of_people;

    function store(uint _fav) public virtual {
        favouriteNumber = _fav;
    }

    mapping(string => uint256) public nameToFav;

    function retrieve() public view returns  (uint256) {
        return favouriteNumber;
    }

  
    function addPerson(uint256 _favNumber , string memory _name) public {
        list_of_people.push(Person(_favNumber,_name));
        nameToFav[_name] = _favNumber;
    }
}

