pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;
import "./libraries/StringLibrary.sol";
import "./models/TipoEnergia.sol";

contract Generador {
    struct plantaEnergia {
        string nombre;
        string localizacion;
        TipoEnergia tipoEnergia;
    }

    address nullAddress = 0x0000000000000000000000000000000000000000;
    plantaEnergia[] plantasEnergia;
    mapping(string => address) compradoresEnergia;
    mapping(address => uint256) ofertaEnergiaPorTipo;

    mapping(string => TipoEnergia) tiposEnergiasGenerador;
    using StringLibrary for string;

    function GenerarNuevaEnergia(string memory nombreTipoEnergia) public {
        TipoEnergia tempTipoEnergia;
        if (nombreTipoEnergia.equals("solar")) {
            tempTipoEnergia = new EnergiaSolar("solar");
        } else if (nombreTipoEnergia.equals("eolica")) {
            tempTipoEnergia = new EnergiaEolica("eolica");
        } else {
            tempTipoEnergia = new EnergiaHidraulica("hidraulica");
        }

        tiposEnergiasGenerador[nombreTipoEnergia] = tempTipoEnergia;
    }

    function InyectarEnergia() public {}

    function venderEnergia() public {}

    function crearPlantaEnergia(
        string memory nombrePlanta,
        string memory localizacion,
        string memory nombreTipoEnergia
    ) public {
        bytes32 hashNull = keccak256(abi.encode(nullAddress));
        bytes32 hashEnergia = keccak256(
            abi.encode(address(tiposEnergiasGenerador[nombreTipoEnergia]))
        );

        require(hashEnergia != hashNull, "No existe el tipo de energia");
        plantaEnergia memory tempPlantaEnergia = plantaEnergia(
            nombrePlanta,
            localizacion,
            tiposEnergiasGenerador[nombreTipoEnergia]
        );
        plantasEnergia.push(tempPlantaEnergia);
    }

    function obtenerPlantasDisponibles()
        public
        view
        returns (plantaEnergia[] memory)
    {
        return plantasEnergia;
    }

    function getTipoEnergia(string memory nombreEnergia)
        public
        view
        returns (TipoEnergia)
    {
        return tiposEnergiasGenerador[nombreEnergia];
    }
}
