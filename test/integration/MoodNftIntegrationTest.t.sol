//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;
import {Test,console} from "forge-std/Test.sol";
import {MoodNft} from "../script/DeployMoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftIntegrationTest is Test{

    MoodNft moodNft;
    string public constant HAPPY_SVG_IMAGE_URI = "";
    string public constant SAD_SVG_IMAGE_URI = "";
    string public constant SAD_SVG_URI = "";
    DeployMoodNft deployer;

    address USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    } 

    function testViewTokenURIIntegration() public {

        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function  testFlipTokenToSad() public {
        vm.prank(USER);
        moodNft.mintNft();

        vm.prank(USER);
        moodNft.flipMood(0);

        assertEq(keccak256(abi.encodePacked(moodNft.tokenURI(0))), keccak256(abi.encodePacked(SAD_SVG_URI)) );
    }

}