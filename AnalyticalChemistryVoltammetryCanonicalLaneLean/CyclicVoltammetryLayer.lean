import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryCore

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure CyclicVoltammetryCertificate where
  datum : VoltammetryDatum
  sweepSegment : String
  startPotential : ℝ
  vertexPotential : ℝ
  endPotential : ℝ
  scanDirection : String
  peakPotentialForward : ℝ
  peakPotentialReverse : ℝ
  peakCurrentForward : ℝ
  peakCurrentReverse : ℝ
  reversibleChecked : Bool
  diffusionControlled : Bool

default instance : Inhabited CyclicVoltammetryCertificate :=
  ⟨{ datum := default,
     sweepSegment := "forward",
     startPotential := 0,
     vertexPotential := 1,
     endPotential := 0,
     scanDirection := "negative",
     peakPotentialForward := 0.5,
     peakPotentialReverse := 0.45,
     peakCurrentForward := 1e-6,
     peakCurrentReverse := 9e-7,
     reversibleChecked := true,
     diffusionControlled := true }⟩

def CyclicVoltammetryLayerClosed (C : CyclicVoltammetryCertificate) : Prop :=
  C.reversibleChecked = true ∧
  C.diffusionControlled = true ∧
  C.peakCurrentForward > 0 ∧
  C.peakCurrentReverse > 0

theorem cyclic_voltammetry_layer_closed_checked :
    CyclicVoltammetryLayerClosed (default : CyclicVoltammetryCertificate) := by
  unfold CyclicVoltammetryLayerClosed
  simp

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse