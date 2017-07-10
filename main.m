%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

clear all;
format long;

delta = 0.05;
max_int =100;

% carrega func, n, x, t e y
dados2;

x_inicio = x;

passo = 1.0;

for i = 1:max_int
  
  %erros
  r = erro(func,x,t,y);
  er = sum((r.*r)/2);
  er_med = er/size(t)(1);

  %print
  printf('%d/%d interacoes, erro: %f\n',i-1,max_int,er);
  fflush(stdout);
  
  %jacobiana para todo r
  jacob = erro(func,x,t,y,true);
  
  %aproximacao da hessiana
  hessiana = jacob'*jacob;
  gradiente = jacob'*r;
  
  %direcao = -inv(hessiana)*gradiente;
  direcao = -hessiana\gradiente;
  
  %sum(abs(r).**2)%|r|^2
  %er             %f(x)
  %norm(direcao)  %|p_i^GN|
  
  %passo = armijo(func,x,t,y,er,gradiente,direcao)
  
  %atualizacao
  x =x+ passo*direcao
  
  %escape
  if norm(direcao) < delta
    break;
  end

end

%=======================================
%=====print final
%=======================================
printf('%d/%d interacoes, erro: %f\n',i,max_int,er);
printf('----------------------------------\n');
if (strcmp(func,'func'))
  printf('y = %f*exp(%f*t)\n',x(1),x(2))
elseif(strcmp(func,'func2'))
  printf('y = %f*sin(%f*t+%f)+%f\n',x(1),x(2),x(3),x(4))
end

%=======================================
%=====graficos
%=======================================
clf;

%dados
ts = min(t):0.1:max(t);
ys = feval(func,x_inicio,ts);
ys2 = feval(func,x,ts);

%grafico 1 - Inicio
plot(ts,ys,'linewidth',2.0);
hold on
plot(t, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor','k', 
     'LineWidth', 2, 'MarkerSize', 6)%pontos
hold off

%grafico 2 - Final
figure(2)
plot(ts,ys2,'linewidth',2.0);
hold on
plot(t, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor','k', 
     'LineWidth', 2, 'MarkerSize', 6)%pontos
hold off

