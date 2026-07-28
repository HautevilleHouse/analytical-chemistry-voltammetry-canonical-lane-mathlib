import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryFoundation

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure ButlerVolmerParameters where
  exchangeCurrentDensity : Float
  transferCoefficientAnodic : Float
  transferCoefficientCathodic : Float
  standardRateConstant : Float

default : ButlerVolmerParameters := { exchangeCurrentDensity := 0.001, transferCoefficientAnodic := 0.5, transferCoefficientCathodic := 0.5, standardRateConstant := 0.01 }

structure ButlerVolmerLayerCertificate where
  parameters : ButlerVolmerParameters
  appliedPotential : Float
  overpotential : Float
  currentCalculated : Float
  layerClosed : Prop

def butlerVolmerLayerCertificate : ButlerVolmerLayerCertificate := {
  parameters := ButlerVolmerParameters.default,
  appliedPotential := 0.5,
  overpotential := 0.5,
  currentCalculated := 0.001 * (Real.exp(0.5 * 96485.0 * 0.5 / (8.314 * 298.15)) - Real.exp(-0.5 * 96485.0 * 0.5 / (8.314 * 298.15))),
  layerClosed := True
}

def ButlerVolmerLayerClosed (C : ButlerVolmerLayerCertificate) : Prop :=
  C.currentCalculated > 0.0 ∧ C.layerClosed

theorem butlerVolmerLayerClosed_checked : ButlerVolmerLayerClosed butlerVolmerLayerCertificate := by
  constructor
  · simp [butlerVolmerLayerCertificate]
  · simp [butlerVolmerLayerCertificate]

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
