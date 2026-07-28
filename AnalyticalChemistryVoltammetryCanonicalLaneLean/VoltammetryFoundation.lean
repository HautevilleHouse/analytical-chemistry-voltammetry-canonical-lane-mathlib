import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure Electrode where
  material : String
  area : Float

default : Electrode := { material := "platinum", area := 0.1 }

structure Solution where
  analyte : String
  concentration : Float
  temperature : Float
  solvent : String

default : Solution := { analyte := "ferrocene", concentration := 0.001, temperature := 298.15, solvent := "acetonitrile" }

structure VoltammetryCell where
  workingElectrode : Electrode
  referenceElectrode : Electrode
  solution : Solution

default : VoltammetryCell := { workingElectrode := Electrode.default, referenceElectrode := { material := "silver", area := 0.01 }, solution := Solution.default }

structure PotentialSweep where
  startPotential : Float
  endPotential : Float
  scanRate : Float
  stepPotential : Float

default : PotentialSweep := { startPotential := 0.0, endPotential := 1.0, scanRate := 0.1, stepPotential := 0.001 }

structure CurrentMeasurement where
  potential : Float
  current : Float
  time : Float

default : CurrentMeasurement := { potential := 0.0, current := 0.0, time := 0.0 }

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
