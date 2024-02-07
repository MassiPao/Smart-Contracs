// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameAssets is ERC1155, Ownable {

    string public name = "My Game Asset";  //per dare il nome alla collezione

    uint256 public constant SPADA = 1;
    uint256 public constant SCUDO = 2;
    uint256 public constant ORO = 3;
    uint256 public constant ARGENTO = 4;
    

    constructor(address initialOwner) ERC1155("https://coral-advanced-wolf-753.mypinata.cloud/ipfs/QmbjJtcBfsmo2Wx7dd4W9WfkAuCRLfxukRrb1ZEEJ6prR5/{id}.json") Ownable(initialOwner) {
        mint(msg.sender, SPADA, 1, "");     //DEFINISCO GLI ID
        mint(msg.sender, SCUDO, 1, "");    //automatizzando la parte di minting
        mint(msg.sender, ORO, 100, "");
        mint(msg.sender, ARGENTO, 100, "");


    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
