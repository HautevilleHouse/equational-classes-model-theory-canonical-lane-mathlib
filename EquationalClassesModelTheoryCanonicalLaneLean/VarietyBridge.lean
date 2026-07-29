import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure VarietyBridgePackage where
  signature : EquationalSignature
  equationalTheory : EquationalTheory signature
  variety : Set (Model signature)
  theoryClosedUnderDeduction : Prop
  varietyIsModelClass : Prop

structure VarietyBridgeEvidence (V : VarietyBridgePackage) where
  theoryClosedUnderDeductionClosed : V.theoryClosedUnderDeduction
  varietyIsModelClassClosed : V.varietyIsModelClass

def VarietyBridgeClosed (V : VarietyBridgePackage) : Prop :=
  V.theoryClosedUnderDeduction ∧ V.varietyIsModelClass

theorem variety_bridge_closed_from_evidence (V : VarietyBridgePackage) (E : VarietyBridgeEvidence V) :
    VarietyBridgeClosed V := by
  exact And.intro E.theoryClosedUnderDeductionClosed E.varietyIsModelClassClosed

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse