import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EquationalClassesModelTheoryCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EquationalClassesModelTheoryCanonicalLaneLean.EquationalLogic

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure FreeAlgebra (sig : Type u) (X : Type v) where
  carrier : Type w
  interpretation : Term sig → carrier
  universalProperty : Prop

structure FreeAlgebraEvidence {sig : Type u} {X : Type v} (F : FreeAlgebra sig X) where
  universalPropertyClosed : F.universalProperty

def FreeAlgebraClosed {sig : Type u} {X : Type v} (F : FreeAlgebra sig X) : Prop :=
  F.universalProperty

theorem free_algebra_closed_from_evidence {sig : Type u} {X : Type v} (F : FreeAlgebra sig X) (E : FreeAlgebraEvidence F) : FreeAlgebraClosed F :=
  E.universalPropertyClosed

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse
