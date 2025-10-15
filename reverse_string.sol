// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract reverse_string{

    //字符串反转
    function reverseString(string memory input) public pure returns (string memory){
        bytes memory inputBytes = bytes(input);
        uint256 length = inputBytes.length;

        for(uint256 i = 0; i < length / 2; i++){
            (inputBytes[i], inputBytes[length - i - 1]) = (inputBytes[length - i - 1], inputBytes[i]);
        }
        return string(inputBytes);
    }
}