pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/mgrSpell.sol";

contract MgrSpellTest is Test {
    MgrSpell mgrSpell;

    function setUp() public {
        console.log(address(this));
        mgrSpell = new MgrSpell();
        vm.prank(mgrSpell.poolRoot1());
        mgrLike(mgrSpell.BTPoolMgr1()).rely(address(mgrSpell));
    }

    function testCast() public {
        mgrSpell.cast();
    }
}
