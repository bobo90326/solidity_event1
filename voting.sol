// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract voting {
    //用于存储候选人的得票数 mapping(候选人名称 =》 得票数)
    mapping(string => uint256) private votes;
    
    //用于存储候选人的名字
    string[] private candidates;

    //投票事件
    event Voted(string indexed candidates,address indexed voter,uint256 newVoteCount);

    // 投票函数
    function vote(string memory candidate) public {
        //如果是新的候选人，添加到列表
        if (votes[candidate] == 0) {
            candidates.push(candidate);
        }
        //增加候选人的票数
        votes[candidate]++;

        emit Voted(candidate, msg.sender, votes[candidate]);

    }

    //返回某个候选人的得票数
    function getVotes(string memory candidate) public view returns (uint256){
        return votes[candidate];
    }

    //重置所有候选人的得票数
    function resetVotes() public {
        for (uint256 i =0; i<candidates.length; i++) 
        {
            delete votes[candidates[i]];
        }
        delete candidates;
    }
}