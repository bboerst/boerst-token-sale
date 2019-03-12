pragma solidity ^0.5.0;

contract BoerstToken {
    string  public name = "Boerst Token";
    string  public symbol = "BOERST";
    string  public standard = "Boerst Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _tokens
    );

    event Approval(
        address indexed _tokenOwner,
        address indexed _spender,
        uint _tokens
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint _tokens) public returns (bool success) {
        require(balanceOf[msg.sender] >= _tokens, "Sender balance must be greater than or equal to the amount to transfer.");

        balanceOf[msg.sender] -= _tokens;
        balanceOf[_to] += _tokens;

        emit Transfer(msg.sender, _to, _tokens);

        return true;
    }

    function approve(address _spender, uint _tokens) public returns (bool success) {
        allowance[msg.sender][_spender] = _tokens;

        emit Approval(msg.sender, _spender, _tokens);

        return true;
    }

    function transferFrom(address _from, address _to, uint _tokens) public returns (bool success){
        require(_tokens <= balanceOf[_from], "From balance must be greater than or equal to the amount to transfer.");
        require(_tokens <= allowance[_from][msg.sender], "Sender balance must be allowed to spend the requested amount.");

        balanceOf[_from] -= _tokens;
        balanceOf[_to] += _tokens;
        
        allowance[_from][msg.sender] -= _tokens;
        
        emit Transfer(_from, _to, _tokens);

        return true;
    }
}