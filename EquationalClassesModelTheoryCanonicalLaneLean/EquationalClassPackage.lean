import canonicalLaneMathlib.AdmissibleClass
import EquationalClassesModelTheoryCanonicalLaneLean.AdmittedObject

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure EquationalClassPackage (S : EquationalSignature) where
  theory : Set (Equation S)
  class : Set (Algebra S)
  closedUnderEquations : ∀ (eq : Equation S), eq ∈ theory → ∀ (A : Algebra S), A ∈ class → A ⊧ eq
  closedUnderHSP : classIsVariety class

def EquationalClassEvidence {S : EquationalSignature} (P : EquationalClassPackage S) : Prop :=
  P.closedUnderEquations ∧ P.closedUnderHSP

def EquationalClassClosed {S : EquationalSignature} (P : EquationalClassPackage S) : Prop :=
  P.closedUnderEquations ∧ P.closedUnderHSP

theorem equational_class_closed_from_evidence {S : EquationalSignature} (P : EquationalClassPackage S) (E : EquationalClassEvidence P) :
    EquationalClassClosed P := by
  exact And.intro E.1 E.2

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse