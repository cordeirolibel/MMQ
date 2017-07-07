%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

% w in R4

function y = func2(w, x, ordem = 0)
  
  if ordem == 0
    y = w(1).*sin(w(2).*x+w(3))+w(4);
  elseif ordem == 1 %gradiente
    %df(w)/dw1
    y(1,:) = sin(w(2).*x+w(3));
    %df(w)/dw2
    y(2,:) = w(1).*(cos(w(2).*x+w(3))).*x;
    %df(w)/dw3
    y(3,:) = w(1).*cos(w(2).*x+w(3));
    %df(w)/dw4
    y(4,:) = 1;
  else
    printf('Ordem %d nao definida',ordem);
  end

end