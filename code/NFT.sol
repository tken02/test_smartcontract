// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract createNFT is ERC721{
    using Strings for uint256;
    string public domain = "https://raw.githubusercontent.com/tken02/test_smartcontract/main/card_Image/";

    constructor() ERC721("NFT Demo", "NFTD") {}

    function tokenURI(uint256 tokenID) public view virtual override returns(string memory){
        require(_exists(tokenID),"Token ID is not exsists");
        if(bytes(domain).length > 0){
            return string(abi.encodePacked(domain, tokenID.toString(), ".json"));
        }
        else return "";
    }
    function mintImage(address to, uint256 tokenID) external{
        _mint(to, tokenID);
    }

}