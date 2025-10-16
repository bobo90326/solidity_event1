// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract Roman {
    
    
    function getValue(bytes1 char) private pure returns (uint256) {
        if (char == 'I') return 1;
        if (char == 'V') return 5;
        if (char == 'X') return 10;
        if (char == 'L') return 50;
        if (char == 'C') return 100;
        if (char == 'D') return 500;
        if (char == 'M') return 1000;
        revert("Invalid roman character");
    }

    //罗马数字转整型
    function romanToInt(string memory s) public pure returns (uint256) {
        bytes memory romanBytes = bytes(s);
        int256 result = 0;
        uint256 length = romanBytes.length;
        
        for (uint256 i = 0; i < length; i++) {
            int256 currentValue = int256(getValue(romanBytes[i]));
            
            // 如果不是最后一个字符，检查是否需要减法
            if (i < length - 1) {
                int256 nextValue = int256(getValue(romanBytes[i + 1]));
                
                // 当前值小于下一个值时执行减法（如 IV=4, IX=9）
                if (currentValue < nextValue) {
                    result -= currentValue;
                } else {
                    result += currentValue;
                }
            } else {
                // 最后一个字符直接相加
                result += currentValue;
            }
        }
        
        return uint256(result);
    }


    // 整数转罗马数字
    function intToRoman(uint256 num) public pure returns (string memory) {
        require(num >= 1 && num <= 3999, "Number must be between 1 and 3999");
        
        uint256[13] memory values = [
            uint256(1000), 900, 500, 400, 100,
            90, 50, 40, 10, 9, 5, 4, 1
        ];
        
        string[13] memory symbols = [
            "M", "CM", "D", "CD", "C",
            "XC", "L", "XL", "X", "IX", "V", "IV", "I"
        ];
        
        string memory result = "";
        
        for (uint256 i = 0; i < 13; i++) {
            while (num >= values[i]) {
                result = string(abi.encodePacked(result, symbols[i]));
                num -= values[i];
            }
        }
        
        return result;
    }


}