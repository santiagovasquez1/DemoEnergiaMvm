pragma solidity >=0.4.0  < 0.7.0;

abstract contract TipoEnergia {
    string public nombre;
    uint public cantidad;
    uint public precio;

    function calcularPrecio() external virtual returns (uint);
}


contract EnergiaSolar is TipoEnergia {

    constructor (string memory _nombre) public {
        nombre = _nombre;
    }

    function calcularPrecio () public override returns (uint){

    }
}

contract EnergiaEolica is TipoEnergia{
    constructor (string memory _nombre) public {
        nombre = _nombre;
    }
    function calcularPrecio () public override returns (uint){

    }
}

contract EnergiaHidraulica is TipoEnergia{
    constructor (string memory _nombre) public {
        nombre = _nombre;
    }
    function calcularPrecio () public override returns (uint){

    }
}