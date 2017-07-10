%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

% x in R4

function y = func2(x, t, ordem = 0)
  
  if ordem == 0
    y = x(1).*sin(x(2).*t+x(3))+x(4);
  elseif ordem == 1 %gradiente
    %df(w)/dw1
    y(1,:) = sin(x(2).*t+x(3));
    %df(w)/dw2
    y(2,:) = x(1).*(cos(x(2).*t+x(3))).*t;
    %df(w)/dw3
    y(3,:) = x(1).*cos(x(2).*t+x(3));
    %df(w)/dw4
    y(4,:) = 1;
  else
    printf('Ordem %d nao definida',ordem);
  end

end