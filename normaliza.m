%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%


%encontra a e b tal que: y = x*a+b, y(1) = 1, y(2) = 2
%retorna tambem os dados normalizados
function [a,b,y] = normaliza(x)
  
  % x(1)*a+b = 1
  % x(2)*a+b = 2
  
  a = 1/(x(2)-x(1));
  b = 1-x(1)*a;
  
  y = x.*a+b;