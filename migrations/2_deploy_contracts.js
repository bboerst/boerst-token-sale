const BoerstToken = artifacts.require("BoerstToken");

module.exports = function(deployer) {
  deployer.deploy(BoerstToken);
};
