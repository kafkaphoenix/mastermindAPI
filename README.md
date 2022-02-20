# mastermindAPI
API project for playing mastermind

# About
Mastermind is a logic board game from the 70’s in which you have to correctly
guess a random secret code in a determined number of guesses. This game can be
played by two players, the code-maker and the code-breaker.

- The code-maker creates the secret combination, composed by a sequence of
4 colored pegs.

- The code-breaker makes a series of guesses, each guess composed in the
same way by 4 colored pegs. After each guess, the code-maker gives
feedback to the code-breaker to see how close you got to the real secret
code.

Each feedback is composed of two numbers, represented by white pegs and black
pegs, and they tell you how your guess and the secret combination compare. Black
pegs tell you how many pegs of your guess you have correct in color and position,
and white pegs tell you how many pegs of your guess you have correct in color but
not in the proper position.

Here you have several examples to see how the algorithm to compute the
feedback works:

| code | guess | black pegs | white pegs |
|------|-------|------------|------------|
| RGGB | RGGB  | 4          | 0          |
| RRRR | BYOB  | 0          | 0          |
| GBBR | GBRB  | 2          | 2          |
| BBBR | RBGG  | 1          | 1          |
| RBGG | BBBR  | 1          | 1          |
| BBBR | BBBR  | 4          | 0          |
| WBWB | BWBW  | 0          | 4          |
| OOOW | OWWW  | 2          | 0          |

Legend: (R)ed, (B)lue, (Y)ellow, (G)reen, (W)hite, (O)range
