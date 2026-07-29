import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EquationalClassesModelTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure Term (sig : Type u) where
  var : Nat → Term sig
  op : sig → List (Term sig) → Term sig

structure Equation (sig : Type u) where
  lhs : Term sig
  rhs : Term sig

structure EquationalTheory (sig : Type u) where
  equations : List (Equation sig)
  closedUnderDeduction : Prop

structure EquationalTheoryEvidence (T : EquationalTheory sig) where
  closedUnderDeductionClosed : T.closedUnderDeduction

def EquationalTheoryClosed (T : EquationalTheory sig) : Prop :=
  T.closedUnderDeduction

theorem equational_theory_closed_from_evidence (T : EquationalTheory sig) (E : EquationalTheoryEvidence T) : EquationalTheoryClosed T :=
  E.closedUnderDeductionClosed

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse
