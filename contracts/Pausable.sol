/**
* MIT License
*
* Copyright (c) 2016-2019 zOS Global Limited
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/
pragma solidity 0.5.10;

import "./Ownable.sol";

contract Pausable is Ownable {

    /** This contract is pausable.  */
    bool public paused = false;

    /** @dev Function to set pause.
     * This could for example be used in case of a fork of the network, in which case all
     * "wrong" forked contracts should be paused in their respective fork. Deciding which
     * fork is the "right" one is up to the owner of the contract.
     */
    function pause(bool _pause, string calldata _message, address _newAddress, uint256 _fromBlock) external onlyOwner() {
        paused = _pause;
        emit Pause(_pause, _message, _newAddress, _fromBlock);
    }

    event Pause(bool paused, string message, address newAddress, uint256 fromBlock);
}