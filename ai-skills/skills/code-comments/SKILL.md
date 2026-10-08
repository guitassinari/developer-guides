---
name: code-comments
description: Guidance on how and when to write code comments, language-agnostic. Use whenever writing, reviewing, or refactoring code and deciding whether a comment is warranted, what it should say, and how it should be formatted. Trigger for questions like "should I comment this", "write good comments", "is this comment necessary", or when generating any code that a human will read.
---
 
# Writing Code Comments
 
Code shows how. Comments explain why. Fix "how" problems by clarifying code, not by commenting around them.
 
## 1. Simplify before commenting
 
Try renaming, extracting functions, or replacing magic values with named constants before adding a comment. More comments do not mean more readable code.
 
**Before:**
```c
if (0 > x - deviceInfo->position.x) {
    directionCode = 0x04 /*left*/;
} else if (0 < x - deviceInfo->position.x) {
    directionCode = 0x02 /*right*/;
}
```
 
**After:**
```c
static const int DIRECTION_RIGHT = 0x02;
static const int DIRECTION_LEFT  = 0x04;
static const int DIRECTION_NONE  = 0x00;
 
int oldX = deviceInfo->position.x;
int directionCode = (x > oldX) ? DIRECTION_RIGHT
                  : (x < oldX) ? DIRECTION_LEFT
                  : DIRECTION_NONE;
```
 
## 2. Comment only what code cannot express
 
Valid reasons to comment: rationale, rejected alternatives, non-obvious intent.
 
```
/* A binary search turned out to be slower than the Boyer-Moore
   algorithm for the data sets of interest, so we use the more
   complex but faster method here. */
```
 
Invalid reason: restating what the code already shows.
 
```
% Add two numbers (x and y) together.
function z = adder(x, y)
```
 
## 3. Rules for comments that exist
 
- **Keep them next to the code they describe.** Distance causes drift.
- **Use simple formatting.** Complex templates (boxes, revision-history blocks) get skipped during edits and go stale.
- **Don't duplicate source control.** No authorship/changelog comments.
- **Write complete sentences that add information**, not restatements.
- **Make TODOs specific and owned**, not `TODO: fix this`.
  - Bad: `# TODO: make it work.`
  - Good: `# TODO: (@name) implement predictor-corrector integrator; shocks appear with current method.`
- **Maintain comments like code.** A wrong comment is worse than none.
- **Do NOT reference external documents** (e.g., design docs, wiki pages, tickets) that may not be maintained or accessible. Comment should be self-contained.

## Checklist
 
1. Can code be changed to remove the need for this comment?
2. Does it explain why, not what?
3. Is it adjacent to the relevant code?
4. Is it a plain sentence, not a heavy template or redundant metadata?
5. If a TODO, does it name the problem and an owner?