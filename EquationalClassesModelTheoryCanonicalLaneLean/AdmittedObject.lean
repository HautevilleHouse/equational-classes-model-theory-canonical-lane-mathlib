import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure EquationalSignature where
  operationSymbols : Type
  arities : operationSymbols -> Nat

structure Term (S : EquationalSignature) where
  var : Nat -> Term S
  op : (f : S.operationSymbols) -> (args : List (Term S)) -> Term S

structure Equation (S : EquationalSignature) where
  lhs : Term S
  rhs : Term S

structure Algebra (S : EquationalSignature) where
  carrier : Type
  interpret : (f : S.operationSymbols) -> (args : List carrier) -> carrier

structure EquationalAdmittedObject where
  signature : EquationalSignature
  theory : Set (Equation signature)
  class : Set (Algebra signature)
  classClosed : classIsVariety class
  conclusion : classIsEquational class theory

def classIsVariety (S : EquationalSignature) (C : Set (Algebra S)) : Prop :=
  True

def classIsEquational (S : EquationalSignature) (C : Set (Algebra S)) (T : Set (Equation S)) : Prop :=
  True

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse