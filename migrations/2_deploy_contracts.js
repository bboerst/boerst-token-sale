const BoerstToken = artifacts.require("BoerstToken");
const BoerstTokenSale = artifacts.require("BoerstTokenSale");

module.exports = function(deployer) {
  deployer.deploy(BoerstToken, 1000000).then(function() {
    // Token price is 0.001 Ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(BoerstTokenSale, BoerstToken.address, tokenPrice);
  });
};
