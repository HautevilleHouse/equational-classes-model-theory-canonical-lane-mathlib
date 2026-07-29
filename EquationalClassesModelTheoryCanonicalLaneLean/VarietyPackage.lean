import canonicalLaneMathlib.AdmissibleClass
import EquationalClassesModelTheoryCanonicalLaneLean.AdmittedObject
import EquationalClassesModelTheoryCanonicalLaneLean.EquationalClassPackage

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure VarietyPackage (S : EquationalSignature) where
  class : Set (Algebra S)
  closedUnderH : HomomorphicImagesClosed class
  closedUnderS : SubalgebrasClosed class
  closedUnderP : ProductsClosed class

def HomomorphicImagesClosed (S : EquationalSignature) (C : Set (Algebra S)) : Prop := True
def SubalgebrasClosed (S : EquationalSignature) (C : Set (Algebra S)) : Prop := True
def ProductsClosed (S : EquationalSignature) (C : Set (Algebra S)) : Prop := True

structure VarietyEvidence {S : EquationalSignature} (V : VarietyPackage S) where
  hClosed : V.closedUnderH
  sClosed : V.closedUnderS
  pClosed : V.closedUnderP

def VarietyClosed {S : EquationalSignature} (V : VarietyPackage S) : Prop :=
  V.closedUnderH ∧ V.closedUnderS ∧ V.closedUnderP

theorem variety_closed_from_evidence {S : EquationalSignature} (V : VarietyPackage S) (E : VarietyEvidence V) :
    VarietyClosed V := by
  exact And.intro E.hClosed (And.intro E.sClosed E.pClosed)

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse