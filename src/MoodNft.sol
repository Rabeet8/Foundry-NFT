//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {ERC721} "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base.sol";

contract MoodNft is ERC721 {

    errors MoodNft__CantFlipMoodIfNotOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    enum Mood{
        HAPPY,SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory sadSvg, string memory happysvg) ERC721("Mood NFT", "MN"){
        s_tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_happySvg = happySvg;
    }

    function mintNft() public {
        _safeMint(msg.sender,s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.Happy;
        s_tokenCounter ++;
    }

    function _base64URI() internal pure override returns(string memory){
        return "data:application/json;base64,"
    }

    function flipMood(uint256 tokenId) public {
       if(!_isApprovedorOwner(msg.sender,tokenId)) {
        revert MoodNft__CantFlipMoodIfNotOwner() ;
       }
       if(s_tokenIdToMoodp[tokenId] == Mood.HAPPY){
        s_tokenIdToMoodp[tokenId] == Mood.SAD
       }else{
        s_tokenIdToMoodp[tokenId] == Mood.HAPPY

       }
    }
 
    function tokenURI(uint256 tokenId) public view override returns(string memory){
        string memory imageURI;
        

        if(s_tokenIdToMood[tokenId] == Mood.Happy){
            imageURI = s_happySvgImageUri;
        }else {
            imageURI = s_sadSvgImageUri;
        }

        return
        string(
        abi.encodePacked(    
        _baseURI();
        Base64.encode(bytes(abi.encodePacked('{"name":"' name(), '","description", "An NFT that reflects the owners mood". "attributes":[{"trait_type": "moodiness", "value":100}], "image":"',imageURI,'"}')))));

    
    }
}