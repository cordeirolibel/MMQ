%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

% x in R2

function y = func(x, t, ordem = 0)
  
  if ordem == 0
    y = x(1).*exp(x(2).*t);
  elseif ordem == 1 %gradiente
    %df(w)/dw1
    y(1,:) = exp(x(2).*t);
    %df(w)/dw2
    y(2,:) = (x(1).*t).*exp(x(2).*t); 
  else
    printf('Ordem %d nao definida',ordem);
  end

end