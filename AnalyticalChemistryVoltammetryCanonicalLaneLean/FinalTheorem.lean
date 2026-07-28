import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.ButlerVolmerKinetics
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.DiffusionLayer
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.RandlesSevcikLayer
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.Formalization

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure VoltammetryAdmissibleClass where
  butlerVolmerLayerClosed : Prop
  diffusionLayerClosed : Prop
  randlesSevcikLayerClosed : Prop
  formalizationClosed : Prop

def voltammetryAdmissibleClass : VoltammetryAdmissibleClass := {
  butlerVolmerLayerClosed := ButlerVolmerLayerClosed butlerVolmerLayerCertificate,
  diffusionLayerClosed := DiffusionLayerClosed diffusionLayerCertificate,
  randlesSevcikLayerClosed := RandlesSevcikLayerClosed randlesSevcikLayerCertificate,
  formalizationClosed := VoltammetryFormalizationClosed voltammetryFormalizationCertificate
}

def bridgeClosed (V : VoltammetryAdmissibleClass) : Prop :=
  V.butlerVolmerLayerClosed ∧ V.diffusionLayerClosed ∧ V.randlesSevcikLayerClosed

theorem bridge_from_voltammetry (V : VoltammetryAdmissibleClass) : bridgeClosed V := by
  dsimp [bridgeClosed]
  have h1 : ButlerVolmerLayerClosed butlerVolmerLayerCertificate := butlerVolmerLayerClosed_checked
  have h2 : DiffusionLayerClosed diffusionLayerCertificate := diffusionLayerClosed_checked
  have h3 : RandlesSevcikLayerClosed randlesSevcikLayerCertificate := randlesSevcikLayerClosed_checked
  exact ⟨h1, h2, h3⟩

def gateClosed (V : VoltammetryAdmissibleClass) : Prop :=
  V.formalizationClosed

theorem gate_from_voltammetry (V : VoltammetryAdmissibleClass) : gateClosed V := by
  dsimp [gateClosed]
  exact voltammetryFormalizationClosed_checked

def ConstrainedVoltammetryClosure (V : VoltammetryAdmissibleClass) : Prop :=
  bridgeClosed V ∧ gateClosed V

theorem constrained_voltammetry_closure (V : VoltammetryAdmissibleClass) : ConstrainedVoltammetryClosure V := by
  exact And.intro (bridge_from_voltammetry V) (gate_from_voltammetry V)

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
