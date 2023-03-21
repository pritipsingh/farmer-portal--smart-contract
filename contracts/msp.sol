// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
//0xae9daad5fe6060d2393500e8A5BD2f62afc3d9F8
contract BuyCrops {
    struct Campaign{
        address owner;
        string title;
        string description;
        uint256 msp;
        uint256 price;
        string image;
        address buyer;
    }

    mapping(uint256 => Campaign) public campaigns;

   
    uint256 public numberOfCampaigns = 0;

     function createCampaign(address _owner , string memory _title , string memory _description , uint256 _msp,uint256 _price,string memory _image) public returns(uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];

        // if everything is good
         campaign.owner = _owner;
         campaign.title = _title;
         campaign.description = _description;
         campaign.msp = _msp;
         campaign.price = _price;
         campaign.image = _image;

     
        numberOfCampaigns++ ;
         return numberOfCampaigns -  1;
    }

    function BuyCampaign(uint256 _id)public payable {
        uint256 amount = msg.value;

        Campaign storage campaign = campaigns[_id];

        campaign.buyer = msg.sender;

        (bool bought,) = payable(campaign.owner).call{value:amount}(""); // sent will have either t or f and here we send the amount to the campaign owner the amount

       
    }
    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);// [{},{},{}] empty created

        for(uint i=0;i<numberOfCampaigns;i++){
            Campaign storage item = campaigns[i];

            allCampaigns[i] = item;
        }
        return allCampaigns;
    }
    function getBuyer(uint256 _id) public view returns (address) {
        return campaigns[_id].buyer;
    }
}