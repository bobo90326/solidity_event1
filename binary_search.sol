// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract BinarySearc{
    
    function search(uint256[] memory nums, uint256 target)public pure returns(uint256){
      if (nums.length == 0) return type(uint256).max;
        
        uint256 left = 0;
        uint256 right = nums.length - 1;
        
        while (left <= right) {
            // 防止溢出的中点计算
            uint256 mid = left + (right - left) / 2;
            
            if (nums[mid] == target) {
                return mid;  // 找到目标值
            } else if (nums[mid] < target) {
                left = mid + 1;  // 目标在右半部分
            } else {
                if (mid ==0) break;
                right = mid - 1;  // 目标在左半部分
            }
        }
        
        return type(uint256).max;  // 未找到
    }

}