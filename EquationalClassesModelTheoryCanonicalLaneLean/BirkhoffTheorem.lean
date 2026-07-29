import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EquationalClassesModelTheoryCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EquationalClassesModelTheoryCanonicalLaneLean.EquationalLogic

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure BirkhoffPackage (sig : Type u) (T : EquationalTheory sig) where
  variety : Type v
  closedUnderHomomorphicImages : Prop
  closedUnderSubalgebras : Prop
  closedUnderDirectProducts : Prop
  birkhoffCharacterization : Prop

structure BirkhoffEvidence {sig : Type u} {T : EquationalTheory sig} (B : BirkhoffPackage sig T) where
  closedUnderHomomorphicImagesClosed : B.closedUnderHomomorphicImages
  closedUnderSubalgebrasClosed : B.closedUnderSubalgebras
  closedUnderDirectProductsClosed : B.closedUnderDirectProducts
  birkhoffCharacterizationClosed : B.birkhoffCharacterization

def BirkhoffClosed {sig : Type u} {T : EquationalTheory sig} (B : BirkhoffPackage sig T) : Prop :=
  B.closedUnderHomomorphicImages ∧ B.closedUnderSubalgebras ∧ B.closedUnderDirectProducts ∧ B.birkhoffCharacterization

theorem birkhoff_closed_from_evidence {sig : Type u} {T : EquationalTheory sig} (B : BirkhoffPackage sig T) (E : BirkhoffEvidence B) : BirkhoffClosed B :=
  And.intro E.closedUnderHomomorphicImagesClosed (And.intro E.closedUnderSubalgebrasClosed (And.intro E.closedUnderDirectProductsClosed E.birkhoffCharacterizationClosed))

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse
