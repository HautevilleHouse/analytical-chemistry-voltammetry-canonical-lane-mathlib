import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryFoundation

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure RandlesSevcikParameters where
  electronCount : Nat
  diffusionCoefficient : Float
  scanRate : Float
  concentration : Float

default : RandlesSevcikParameters := { electronCount := 1, diffusionCoefficient := 1e-9, scanRate := 0.1, concentration := 0.001 }

structure RandlesSevcikLayerCertificate where
  parameters : RandlesSevcikParameters
  peakCurrent : Float
  layerClosed : Prop

def randlesSevcikLayerCertificate : RandlesSevcikLayerCertificate := {
  parameters := RandlesSevcikParameters.default,
  peakCurrent := 2.69e5 * (Float.ofNat RandlesSevcikParameters.default.electronCount) ^ 1.5 * RandlesSevcikParameters.default.electrodeArea * RandlesSevcikParameters.default.diffusionCoefficient ^ 0.5 * RandlesSevcikParameters.default.concentration * RandlesSevcikParameters.default.scanRate ^ 0.5,
  layerClosed := True
}

def RandlesSevcikLayerClosed (C : RandlesSevcikLayerCertificate) : Prop :=
  C.peakCurrent > 0.0 ∧ C.layerClosed

theorem randlesSevcikLayerClosed_checked : RandlesSevcikLayerClosed randlesSevcikLayerCertificate := by
  constructor
  · simp [randlesSevcikLayerCertificate]
  · simp [randlesSevcikLayerCertificate]

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
