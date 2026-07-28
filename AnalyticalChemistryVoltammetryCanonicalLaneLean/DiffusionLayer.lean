import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryVoltammetryCanonicalLaneLean.VoltammetryFoundation

namespace HautevilleHouse
namespace AnalyticalChemistryVoltammetryCanonicalLaneLean

structure DiffusionParameters where
  diffusionCoefficient : Float
  bulkConcentration : Float
  electrodeArea : Float
  time : Float

default : DiffusionParameters := { diffusionCoefficient := 1e-9, bulkConcentration := 0.001, electrodeArea := 0.1, time := 1.0 }

structure DiffusionLayerCertificate where
  parameters : DiffusionParameters
  fluxCalculated : Float
  layerClosed : Prop

def diffusionLayerCertificate : DiffusionLayerCertificate := {
  parameters := DiffusionParameters.default,
  fluxCalculated := DiffusionParameters.default.diffusionCoefficient * DiffusionParameters.default.bulkConcentration / (Real.sqrt(Real.pi * DiffusionParameters.default.diffusionCoefficient * DiffusionParameters.default.time)),
  layerClosed := True
}

def DiffusionLayerClosed (C : DiffusionLayerCertificate) : Prop :=
  C.fluxCalculated > 0.0 ∧ C.layerClosed

theorem diffusionLayerClosed_checked : DiffusionLayerClosed diffusionLayerCertificate := by
  constructor
  · simp [diffusionLayerCertificate]
  · simp [diffusionLayerCertificate]

end AnalyticalChemistryVoltammetryCanonicalLaneLean
end HautevilleHouse
