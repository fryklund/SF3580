A = gallery('neumann',20^2); A = A-A';
A = A/(2*norm(A,1));
save('task7matrix','A');
