//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test,console} from "forge-std/Test.sol";
import {DeployMoodNftTest} from "../src/MoodNft.sol";


contract DeployMoodNftTest is Test {

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri = "";
        string memory svg = '';
       string memory actualUri = deployer.svgToImageURI(svg);
       assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));

    }

}