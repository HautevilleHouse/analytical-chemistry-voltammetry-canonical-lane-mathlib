import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryCore

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

def ConstrainedVoltammetryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_voltammetry_endgame (A : AdmissibleClass) :
    ConstrainedVoltammetryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse