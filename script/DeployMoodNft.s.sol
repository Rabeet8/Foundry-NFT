//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script  {


     function run() external returns (MoodNft){
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happysvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();

        MoodNft moodNft = new MoodNft(
            svgImageURI(sadSvg);
            svgToImageURI(happySvg)
        );

        vm.stopBroadcast();
        return moodNft;
        
     };

     function svgImageToURI(string memory svg) public pure returns(string memory){
        string memory svg
        string memory baseURL = "";
        string memory  svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseUrl,scgBase64Encoded));
     };

}