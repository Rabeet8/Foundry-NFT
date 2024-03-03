//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;
import {Test,console} from "forge-std/Test.sol";
import {MoodNft} from "../srcipt/DeployMoodNft.sol";

contract MoodNftTest is Test{

    MoodNft moodNft;
    string public constant HAPPY_SVG_URI = "";
    string public constant SAD_SVG_URI = "";

    address USER = makeAddr("user");

    function setUp() public {
        moodNft = new MoodNft("sad")
    } 

    function testView() public {

        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

}