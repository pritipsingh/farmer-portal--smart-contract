// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ClaimInsurance{
    struct Insurance{
        address owner;
        string title;
        string description;
        string image;
        bool claimed;
    }

    address owner;

     constructor() {
         owner = msg.sender;
    }

modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
     mapping(uint256 => Insurance) public insurances;

     uint256 public numberOfActiveInsurance = 0;

     function createInsurance(address _owner , string memory _title , string memory _description ,string memory _image) public returns(uint256) {
        Insurance storage insurance = insurances[numberOfActiveInsurance];

        // if everything is good
         insurance.owner = _owner;
         insurance.title = _title;
         insurance.description = _description;
         insurance.image = _image;
         insurance.claimed = false;

         numberOfActiveInsurance++;

         return numberOfActiveInsurance -  1;
    }

 function claimedInsurance(uint256 _id)  public onlyOwner {
        Insurance storage insurance = insurances[_id];
        insurance.claimed = true;
    }

    function getInsurances() public view returns (Insurance[] memory){
        Insurance[] memory allInsurances = new Insurance[](numberOfActiveInsurance);// [{},{},{}] empty created

        for(uint i=0;i<numberOfActiveInsurance;i++){
            Insurance storage item = insurances[i];

            allInsurances[i] = item;
        }
        return allInsurances;
    }

}