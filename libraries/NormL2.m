%Function that computes the Norm L2 of the difference between Vectors
%Input: Vector1 and Vector2 = Vectors to compare (they must be same length)
%
%Output: Similarity= The L2 norm or distance of the difference of the vectors
%
%Department of Computer Science
%Universidad de Guadalajara, Guadalajara, Jalisco, México
%Jun 2015

function Distance = NormL2(Vector1,Vector2)
    A_size = length(Vector1);
    B_size = length(Vector2);
    assert(A_size == B_size, 'Vectors of different dimension');
    assert(A_size > 0 & B_size > 0, 'Empty vectors not allowed');
    Distance = norm(Vector1-Vector2);
end

