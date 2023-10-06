// RUN: %clang_cc1 -fmanifold-expressions -fsyntax-only -Xclang -verify %s

char fn1() {
  return 'a';
}

char fn2() {
  return 'b';
}

// one-of operator.
void test1() {

  if (1 [^] 1,2,3)
  ;

  if (1 one_of 1,2,3)
  ;

  if (1 [^] 1) // expected-error {{expected ','}}
  ;

  if (1 [^] 1& // expected-error {{expected ')'}}
  ;            // expected-error {{expected expression}}

  if (1 [^] 1,2
  { }          // expected-error {{expected expression}}

  if ('a' [^] fn1(), fn2())
  ;
}

// any-of operator.
void test2() {

  if (1 [|] 1,2,3)
  ;

  if (1 any_of 1,2,3)
  ;

  if (1 [|] 1) // expected-error {{expected ','}}
  ;

  if (1 [|] 1& // expected-error {{expected ')'}}
  ;            // expected-error {{expected expression}}

  if (1 [|] 1,2
  { }          // expected-error {{expected expression}}

  if ('a' [|] fn1(), fn2())
  ;
}

// all-of operator.
void test3() {

  if (1 [&] 1,2,3)
  ;

  if (1 any_of 1,2,3)
  ;

  if (1 [&] 1) // expected-error {{expected ','}}
  ;

  if (1 [&] 1& // expected-error {{expected ')'}}
  ;            // expected-error {{expected expression}}

  if (1 [&] 1,2
  { }          // expected-error {{expected expression}}

  if ('a' [&] fn1(), fn2())
  ;
}
