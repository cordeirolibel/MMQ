%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

function passo =  armijo(func,w,x,d,er,grad,direc)

gama = 0.8;
eta = 0.25;

%definindo func_aux
function [y] = func_aux(passo)
  y = er+(eta*passo*grad'*direc) ;
end

function [y] = phi(passo)
  r = erro(func,w+passo*direc,x,d);
  y = sum((r.*r)/2);
end

passo = 1;

k=0;

%Busca do passo
while phi(passo) > func_aux(passo)
  k+=1;
  passo = gama*passo;
end

end