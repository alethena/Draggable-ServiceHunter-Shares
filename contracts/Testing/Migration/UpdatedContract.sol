/**
* MIT License with Automated License Fee Payments
*
* Copyright (c) 2019 Equility AG (alethena.com)
*
* Permission is hereby granted to any person obtaining a copy of this software
* and associated documentation files (the "Software"), to deal in the Software
* without restriction, including without limitation the rights to use, copy,
* modify, merge, publish, distribute, sublicense, and/or sell copies of the
* Software, and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* - The above copyright notice and this permission notice shall be included in
*   all copies or substantial portions of the Software.
* - All automated license fee payments integrated into this and related Software
*   are preserved.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/
pragma solidity ^0.5.10;

import "../../ERC20.sol";

contract UpdatedContract is ERC20 {

    function mint(address receiver, uint256 amount) public {
        _mint(receiver, amount);
    }

    function setApprovals(address oldAddress, uint256 amount) public {
        ERC20 oldContract = ERC20(oldAddress);
        oldContract.approve(oldAddress, amount);
        approve(oldAddress, amount);
    }

    function migrate(address oldAddress) public {
        IMigratable oldContract = IMigratable(oldAddress);
        oldContract.migrate();
    }
}

contract IMigratable {
    function migrate() public;
}