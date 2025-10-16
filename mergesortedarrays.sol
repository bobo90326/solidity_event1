// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract MergeSortArrays{

    function merge(uint256[] memory nums1,uint256[] memory num2) public pure returns(uint256[]memory){
        uint256[] memory ans= new uint256[](nums1.length+num2.length);
        uint256 i=0;
        uint256 j=0;
        uint256 k=0;
        while(i<nums1.length && j<num2.length){
            if(nums1[i]<=num2[j]){
                ans[k]=nums1[i];
                i++;
            }else{
                ans[k]=num2[j];
                j++;
            }
            k++;
        }
        while(i<nums1.length){
            ans[k]=nums1[i];
            i++;
            k++;
        }
        while(j<num2.length){
            ans[k]=num2[j];
            j++;
            k++;
        }
        return ans;
    }

}