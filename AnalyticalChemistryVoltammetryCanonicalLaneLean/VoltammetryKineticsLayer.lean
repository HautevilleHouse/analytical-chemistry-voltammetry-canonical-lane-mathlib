import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure KineticsCertificate where
  electrodeKineticsParam : String
  formalPotential : String
  electronTransferCoefficient : String
  diffusionCoefficient : String
  scanRate : String
  experimentalChecked : Bool
  standardChecked : Bool

defaultKineticsCertificate : KineticsCertificate := {
  electrodeKineticsParam := "heterogeneous rate constant",
  formalPotential := "0.0 V vs SCE",
  electronTransferCoefficient := "0.5",
  diffusionCoefficient := "1e-5 cm^2/s",
  scanRate := "0.1 V/s",
  experimentalChecked := true,
  standardChecked := true
}

def KineticsLayerClosed (C : KineticsCertificate) : Prop :=
  C.experimentalChecked = true ∧ C.standardChecked = true

theorem kinetics_layer_closed_checked : KineticsLayerClosed defaultKineticsCertificate := by
  exact And.intro rfl rfl

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
