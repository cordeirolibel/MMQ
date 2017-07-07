%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

% w in R2

function y = func(w, x, ordem = 0)
  
  if ordem == 0
    y = w(1).*exp(w(2).*x);
  elseif ordem == 1 %gradiente
    %df(w)/dw1
    y(1,:) = exp(w(2).*x);
    %df(w)/dw2
    y(2,:) = (w(1).*x).*exp(w(2).*x); 
  else
    printf('Ordem %d nao definida',ordem);
  end

end