pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface mgrLike {
    function rely(address _addr) external;
    function file(bytes32 _name, address _addr) external;
    function deny(address _addr) external;
}

contract MgrSpell {
    address public MCD_PAUSE_PROXY;
    address public BTPoolMgr1;
    address public BTPoolMgr2;
    address public BTPoolMgr3;
    address public BTPoolMgr4;
    address public urn1;
    address public urn2;
    address public urn3;
    address public urn4;
    address public poolRoot1;
    address public poolRoot2;
    address public poolRoot3;
    address public poolRoot4;
    address public tinlakeMultisig;

    bool public spellCast = false;

    constructor() {
        BTPoolMgr1 = 0x1F5C294EF3Ff2d2Da30ea9EDAd490C28096C91dF;
        BTPoolMgr2 = 0x8e74e529049bB135CF72276C1845f5bD779749b0;
        BTPoolMgr3 = 0x795b917eBe0a812D406ae0f99D71caf36C307e21;
        BTPoolMgr4 = 0x615984F33604011Fcd76E9b89803Be3816276E61;
        MCD_PAUSE_PROXY = 0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB;
        urn1 = 0x4866d5d24CdC6cc094423717663b2D3343d4EFF9;
        urn2 = 0x32C9bBA0841F2557C10d3f0d30092f138251aFE6;
        urn3 = 0xB22E9DBF60a5b47c8B2D0D6469548F3C2D036B7E;
        urn4 = 0x9C170dd80Ee2CA5bfDdF00cbE93e8faB2D05bA6D;
        poolRoot1 = 0x4597f91cC06687Bdb74147C80C097A79358Ed29b;
        poolRoot2 = 0xB5c08534d1E73582FBd79e7C45694CAD6A5C5aB2;
        poolRoot3 = 0x90040F96aB8f291b6d43A8972806e977631aFFdE;
        poolRoot4 = 0x55d86d51Ac3bcAB7ab7d2124931FbA106c8b60c7;
        tinlakeMultisig = 0xf3BceA7494D8f3ac21585CA4b0E52aa175c24C25;
    }

    function cast() public {
        require(!spellCast, "The spell has already been cast.");
        

        run();
        spellCast = true;
    }

    function run() private {
        // Rely the MCD_PAUSE_PROXY contract on the managers
        console.log("1");
        mgrLike(BTPoolMgr1).rely(MCD_PAUSE_PROXY);
        console.log("2");
        mgrLike(BTPoolMgr2).rely(MCD_PAUSE_PROXY);
        mgrLike(BTPoolMgr3).rely(MCD_PAUSE_PROXY);
        mgrLike(BTPoolMgr4).rely(MCD_PAUSE_PROXY);

        // File the urns on the managers
        mgrLike(BTPoolMgr1).file("urn", urn1);
        mgrLike(BTPoolMgr2).file("urn", urn2);
        mgrLike(BTPoolMgr3).file("urn", urn3);
        mgrLike(BTPoolMgr4).file("urn", urn4);

        // Deny the tinlake multisig address on the managers
        mgrLike(BTPoolMgr1).deny(tinlakeMultisig);
        mgrLike(BTPoolMgr2).deny(tinlakeMultisig);
        mgrLike(BTPoolMgr3).deny(tinlakeMultisig);
        mgrLike(BTPoolMgr4).deny(tinlakeMultisig);

        // Deny the root of each pool on the managers
        mgrLike(BTPoolMgr1).deny(poolRoot1);
        mgrLike(BTPoolMgr2).deny(poolRoot2);
        mgrLike(BTPoolMgr3).deny(poolRoot3);
        mgrLike(BTPoolMgr4).deny(poolRoot4);

        // Deny the spell on the managers
        mgrLike(BTPoolMgr1).deny(address(this));
        mgrLike(BTPoolMgr2).deny(address(this));
        mgrLike(BTPoolMgr3).deny(address(this));
        mgrLike(BTPoolMgr4).deny(address(this));
    }
}
