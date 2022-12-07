pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface mgrLike {
    function dai() external view returns (address);
}

contract MgrSpellTest is Test {

    function setUp() public {
        mgrLike mgr = mgrLike(0x1F5C294EF3Ff2d2Da30ea9EDAd490C28096C91dF);
        address dai = mgr.dai();
        console.log(dai);
    }

    function testCast() public {
        assertTrue(true);
    }
}
