import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryCore

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure ReactionKineticsCertificate where
  datum : VoltammetryDatum
  rateConstant : ℝ
  reactionOrder : ℕ
  activationEnergy : ℝ
  preExponentialFactor : ℝ
  rateLaw : String
  reversibleChecked : Bool
  steadyStateChecked : Bool

default instance : Inhabited ReactionKineticsCertificate :=
  ⟨{ datum := default,
     rateConstant := 1e-3,
     reactionOrder := 1,
     activationEnergy := 50000,
     preExponentialFactor := 1e10,
     rateLaw := "first_order",
     reversibleChecked := true,
     steadyStateChecked := true }⟩

def ReactionKineticsLayerClosed (C : ReactionKineticsCertificate) : Prop :=
  C.rateConstant > 0 ∧
  C.activationEnergy > 0 ∧
  C.steadyStateChecked = true ∧
  C.reversibleChecked = true

theorem reaction_kinetics_layer_closed_checked :
    ReactionKineticsLayerClosed (default : ReactionKineticsCertificate) := by
  unfold ReactionKineticsLayerClosed
  simp

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse