%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

function y = erro (func,w,x,d, jacobiana = false)
  
  if jacobiana == false
    y = feval(func,w,x)-d;
  else 
    y = feval(func,w,x,1)';
  end
  
end 