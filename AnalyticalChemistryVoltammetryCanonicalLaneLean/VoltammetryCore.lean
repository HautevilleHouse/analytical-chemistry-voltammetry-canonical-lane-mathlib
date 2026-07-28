import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure VoltammetryDatum where
  potentialRange : ℝ × ℝ
  scanRate : ℝ
  currentPeak : ℝ
  concentration : ℝ
  electrodeArea : ℝ
  diffusionCoefficient : ℝ
  electronNumber : ℕ
  temperature : ℝ
  reversible : Bool

default instance : Inhabited VoltammetryDatum :=
  ⟨{ potentialRange := (0, 0),
     scanRate := 0,
     currentPeak := 0,
     concentration := 0,
     electrodeArea := 0,
     diffusionCoefficient := 0,
     electronNumber := 0,
     temperature := 0,
     reversible := false }⟩

structure ElectrodeKineticsDatum where
  standardRateConstant : ℝ
  transferCoefficient : ℝ
  formalPotential : ℝ

default instance : Inhabited ElectrodeKineticsDatum :=
  ⟨{ standardRateConstant := 0,
     transferCoefficient := 0.5,
     formalPotential := 0 }⟩

structure VoltammetryBridgeState where
  datum : VoltammetryDatum
  kinetics : ElectrodeKineticsDatum
  satisfactionChecked : Prop
  remainderRecorded : Prop
  gateWitness : satisfactionChecked ∨ remainderRecorded

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = "voltammetry_canonical_lane" ∧
  O.object.theoremObject = "Analytical Chemistry Voltammetry Constrained Theorem" ∧
  O.operatorModelChecked ∧
  O.spectralPersistenceBridgeChecked ∧
  O.sourceBoundaryLedgerChecked ∧
  (formalizationCertificate.sourceConjectureClosureClaimed = false)

def ScopedClosure (O : AdmittedTheoremObject) : Prop :=
  NativeBridgeClosed O

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse