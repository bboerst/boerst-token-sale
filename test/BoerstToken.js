const BoerstToken = artifacts.require("BoerstToken");

contract('BoerstToken', function(accounts) {
    it('sets the total supply upon deployment', function() {
        return BoerstToken.deployed().then(function(instance) {
            tokenInstance = instance;
            return tokenInstance.totalSupply();
        }).then(function(totalSupply) {
            assert.equal(totalSupply.toNumber(), 1000000, 'sets the total supplyt to 1,000,000');
        });
    });
})