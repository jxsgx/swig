/* This interface file tests whether whitespace in angle brackets
   effects the SWIG types. SF Bug #221917, reported by
   burchanb@cs.tamu.edu. */

%{
#include <vector>
#include <map>
%}

%typemap(in) vector<int> "/* Xyzzy! */";
%typemap(in) vector<unsigned int> "/* Foo! */";
%typemap(in) map<int,int> "/* Bar! */";

%inline %{
void foo(vector<int > v) {}
void var(vector<unsigned  int> v) {}
void baz(map < int , int > p) {}
%}
