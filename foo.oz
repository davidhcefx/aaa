% https://github.com/mozart/mozart2/wiki
% List comprehensions
L = {2*a | a in A if a > 10} = {22, 28 30} if A = {1, 6, 9, 10, 11, 14, 15}
[A*A suchthat A in 1..5] % [1 4 9 16 25]
[A suchthat A in 1..5]     % [1 2 3 4 5]
[A suchthat A in 1..5 ; 2] % [1 3 5]
[A suchthat A in 1 ; A < 6 ; A+1]                        % [1 2 3 4 5]
[A suchthat A in ([5] ; {Length A} < 6 ; {Nth A 1}-1|A)] % [[5] [4 5] [3 4 5] [2 3 4 5] [1 2 3 4 5]]
[A suchthat A in 1 ; A+1]                                % 1|2|3|4|5|... (infinite list)
[A suchthat A in [1 2 3 4 5]]            % [1 2 3 4 5]
[A suchthat A in [1 2 [3] 4 5]]          % [1 2 [3] 4 5]
[A suchthat A in [A suchthat A in 1..5]] % [1 2 3 4 5]
[A suchthat A from fun{$} 1 end] % 1|1|1|1|1|... (infinite list)
R = r(a:1 b:r(1 2))
fun {Fct F V} F \= b end
[V suchthat _:V in 1#2#3] % [1 2 3]
[V suchthat _:V in R]     % [1 1 2]
[F suchthat F:_ in R]     % [a 1 2]
[F#A suchthat F:A in r(a:1 b:r(1 2))] % [a#1 1#1 2#2] 
[F#A suchthat F:A in R of Fun]        % [a#1 b#r(1 2)]
[A#B suchthat A in [a b c] B in 1 ; B+1]                     % [a#1 b#2 c#3]
[A+B+C suchthat A in 1..5 _:B in 4#5#6 C from fun{$} 10 end] % [15 17 19]
[A#B suchthat A in 1..2 suchthat B in [a b]]                       % [1#a 1#b 2#a 2#b]
[A+B+C suchthat A in 1..2 suchthat B in A..3 suchthat C in A+B..4] % [4 5 6 6 7 8 8]
[A#B suchthat A in 1..2 if A == 1 suchthat B in [a b]]                % [1#a 1#b]
[A#B suchthat A in 1..2 if A == 1 suchthat B in [a b] if B \= a]      % [1#b]
[A#B suchthat A in 1..2 suchthat B in [a b] if A == 1 andthen B \= a] % [1#b]
[1:A if A < 3 suchthat A in 1..5] % ’#’(1:[1 2])
[A if A < 3 suchthat A in 1..5]   % [1 2]
[a b suchthat _ in 1..2]     % [a a]#[b b]
[a:a b:b suchthat _ in 1..2] % ’#’(a:[a a] b:[b b])
[a 1:b suchthat _ in 1..2]   % [b b]#[a a]
[smallerEquals:A if A=< 3 bigger:A if A> 3 suchthat A in [3 4 2 8 5 7 6]] % ’#’(smallerEquals :[3 2] bigger :[4 8 5 7 6])
declare
L = thread [A suchthat lazy A in 1..5] end
% L=_
{List.drop L 1 _}
% L = 1|_
{List.drop L 3 _}
% L = 1|2|3|_
declare
L = thread [A#B suchthat lazy A in 1..5 suchthat B in [a b]] end 
% L=_
{List.drop L 1 _}
% L = 1#a|1#b|_
{List.drop L 2 _}
% L = 1#a|1#b|_
{List.drop L 3 _ }
% L = 1#a|1#b|2#a|2#b|_
[A suchthat A in 1..5 do {Delay 1000}] % [1 2 3 4 5] after 5 seconds
                                              
