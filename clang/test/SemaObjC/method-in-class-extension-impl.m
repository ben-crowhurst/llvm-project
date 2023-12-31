// RUN: %clang_cc1  -fsyntax-only -verify %s
// expected-no-diagnostics

@protocol ViewDelegate @end

@interface NSTextView
- (id <ViewDelegate>)delegate;
@end

@interface FooTextView : NSTextView
@end

@interface FooTextView() 
- (id)delegate;
@end

@implementation FooTextView
- (id)delegate {return 0; }
@end

