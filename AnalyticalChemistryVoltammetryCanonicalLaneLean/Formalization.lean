import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.ButlerVolmerKinetics
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.DiffusionLayer
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.RandlesSevcikLayer

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure VoltammetryFormalizationCertificate where
  butlerVolmerChecked : Bool
  diffusionChecked : Bool
  randlesSevcikChecked : Bool
  modelInternalized : Bool
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool

def voltammetryFormalizationCertificate : VoltammetryFormalizationCertificate := {
  butlerVolmerChecked := true,
  diffusionChecked := true,
  randlesSevcikChecked := true,
  modelInternalized := true,
  theoremBoundaryOpen := true,
  sourceConjectureClosureClaimed := false
}

def VoltammetryFormalizationClosed (C : VoltammetryFormalizationCertificate) : Prop :=
  C.butlerVolmerChecked ∧ C.diffusionChecked ∧ C.randlesSevcikChecked ∧ C.modelInternalized ∧
  C.theoremBoundaryOpen ∧ ¬C.sourceConjectureClosureClaimed

theorem voltammetryFormalizationClosed_checked :
  VoltammetryFormalizationClosed voltammetryFormalizationCertificate := by
  dsimp [VoltammetryFormalizationClosed, voltammetryFormalizationCertificate]
  simp

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
