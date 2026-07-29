import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure BirkhoffPackage where
  signature : EquationalSignature
  variety : Set (Model signature)
  closedUnderHomomorphicImages : Prop
  closedUnderSubalgebras : Prop
  closedUnderDirectProducts : Prop
  varietyIsEquational : Prop

structure BirkhoffEvidence (B : BirkhoffPackage) where
  closedUnderHomomorphicImagesClosed : B.closedUnderHomomorphicImages
  closedUnderSubalgebrasClosed : B.closedUnderSubalgebras
  closedUnderDirectProductsClosed : B.closedUnderDirectProducts
  varietyIsEquationalClosed : B.varietyIsEquational

def BirkhoffClosed (B : BirkhoffPackage) : Prop :=
  B.closedUnderHomomorphicImages ∧ B.closedUnderSubalgebras ∧ B.closedUnderDirectProducts ∧ B.varietyIsEquational

theorem birkhoff_closed_from_evidence (B : BirkhoffPackage) (E : BirkhoffEvidence B) :
    BirkhoffClosed B := by
  exact And.intro E.closedUnderHomomorphicImagesClosed
    (And.intro E.closedUnderSubalgebrasClosed
      (And.intro E.closedUnderDirectProductsClosed E.varietyIsEquationalClosed))

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse