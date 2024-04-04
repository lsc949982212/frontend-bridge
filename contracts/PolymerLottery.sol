//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import './base/UniversalChanIbcApp.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract PolymerLottery is UniversalChanIbcApp, ERC20 {
    constructor(address _middleware) UniversalChanIbcApp(_middleware) ERC20('lottery token', 'LTT') {
        _mint(msg.sender, 100000000000000 * 10 ** decimals());

        _mint(
            0xE8D92106041c41f56aaffE30C79453bBbAba8901, // Lottery pool
            100000000000000 * 10 ** decimals()
        );
    }

    event LotteryScratched(address indexed user, uint256 amount);

    function scratchLottery(address destPortAddr, bytes32 channelId) external {
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;
        uint256 amount;

        if (randomNumber < 40) {
            amount = 1000 * 10 ** decimals();
        } else if (randomNumber < 60) {
            amount = 2000 * 10 ** decimals();
        } else if (randomNumber < 70) {
            amount = 10000 * 10 ** decimals();
        } else {
            amount = 0;
        }

        if (amount > 0) {
            require(balanceOf(0xE8D92106041c41f56aaffE30C79453bBbAba8901) >= amount, 'Lottery pool insufficient balance');
            _transfer(0xE8D92106041c41f56aaffE30C79453bBbAba8901, msg.sender, amount);
            emit LotteryScratched(msg.sender, amount);
            bytes memory payload = abi.encode(msg.sender, amount);
            uint64 timeoutTimestamp = uint64((block.timestamp + 36000) * 1000000000);

            IbcUniversalPacketSender(mw).sendUniversalPacket(channelId, IbcUtils.toBytes32(destPortAddr), payload, timeoutTimestamp);
        }

        
    }

    function onRecvUniversalPacket(
        bytes32 channelId,
        UniversalPacket calldata packet
    ) external override onlyIbcMw returns (AckPacket memory ackPacket) {
        recvedPackets.push(UcPacketWithChannel(channelId, packet));
        (address account, uint256 amount) = abi.decode(packet.appData, (address, uint256));
        _transfer(0xE8D92106041c41f56aaffE30C79453bBbAba8901, account, amount);
        emit LotteryScratched(account, amount);
        return AckPacket(true, abi.encode(packet.appData));
    }
}
