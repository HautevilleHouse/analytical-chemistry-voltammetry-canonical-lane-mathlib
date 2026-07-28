import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure InstrumentCertificate where
  potentiostatModel : String
  workingElectrode : String
  referenceElectrode : String
  scanType : String
  currentRange : String
  potentialRange : String
  calibrationChecked : Bool
  noiseFiltered : Bool

defaultInstrumentCertificate : InstrumentCertificate := {
  potentiostatModel := "CHI660E",
  workingElectrode := "glassy carbon",
  referenceElectrode := "Ag/AgCl",
  scanType := "cyclic voltammetry",
  currentRange := "10 uA",
  potentialRange := "-1.0 to 1.0 V",
  calibrationChecked := true,
  noiseFiltered := true
}

def InstrumentLayerClosed (C : InstrumentCertificate) : Prop :=
  C.calibrationChecked = true ∧ C.noiseFiltered = true

theorem instrument_layer_closed_checked : InstrumentLayerClosed defaultInstrumentCertificate := by
  exact And.intro rfl rfl

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
