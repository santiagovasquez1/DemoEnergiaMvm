pragma solidity >=0.4.0  < 0.7.0;
pragma experimental ABIEncoderV2;

contract Generador {

    struct plantaEnergia {
        string nombre;
        string localizacion;
        TipoEnergia tipoEnergia;
    }

    plantaEnergia[] plantasEnergia;
    mapping(string => address) compradoresEnergia;
    mapping (TipoEnergia => uint) ofertaEnergiaPorTipo;
    mapping (string=>TipoEnergia) tiposEnergiasGenerador;
    using stringComparador for string;

    function GenerarNuevaEnergia (string memory nombreTipoEnergia) public {

        TipoEnergia tempTipoEnergia;
        if(nombreTipoEnergia.equals("solar")){
            tempTipoEnergia = new EnergiaSolar("solar");
        }else if(nombreTipoEnergia.equals("eolica")){
            tempTipoEnergia = new EnergiaEolica("eolica");
        }else{
            tempTipoEnergia = new EnergiaHidraulica("hidraulica");
        }

        tiposEnergiasGenerador[nombreTipoEnergia] = tempTipoEnergia;
    }

    function InyectarEnergia () public {

    }

    function venderEnergia() public {

    }

    function crearPlantaEnergia(string memory nombrePlanta, string memory localizacion, string memory nombreTipoEnergia) public returns (string memory,string memory){

        // TipoEnergia  tempEnergia = tiposEnergiasGenerador[nombreTipoEnergia];
        // string memory stringHashTempEnergia = string (keccak256 (abi.encode(tempEnergia)));
        // string memory hashNull ="0x0000000000000000000000000000000000000000";


        // if (stringHashTempEnergia.equals(hashNull)){
        //     plantaEnergia memory tempPlantaEnergia = plantaEnergia (nombrePlanta,localizacion, tiposEnergiasGenerador[nombreTipoEnergia]);
        //     plantasEnergia.push (tempPlantaEnergia);
        // }

        // return (stringHashTempEnergia,hashNull);
        // require (hashTempEnergia != hashNull, "No existe el tipo de energia");
        // plantaEnergia memory tempPlantaEnergia = plantaEnergia (nombrePlanta,localizacion, tiposEnergiasGenerador[nombreTipoEnergia]);
        // plantasEnergia.push (tempPlantaEnergia);
    }

    function obtenerPlantasDisponibles () public view returns (plantaEnergia[] memory){
        return plantasEnergia;
    }

    function getTipoEnergia (string memory nombreEnergia) public view returns (TipoEnergia){
        return tiposEnergiasGenerador[nombreEnergia];
    }

}


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

library stringComparador{
    
    function equals (string memory cadena1, string memory cadena2) public pure returns (bool){
        bytes32 hashCadena1 = keccak256(abi.encode (cadena1));
        bytes32 hashCadena2 = keccak256(abi.encode (cadena2));
        return hashCadena1==hashCadena2;
    }
}