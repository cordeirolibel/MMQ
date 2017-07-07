%-----------------------------------------------------%
%>>>>>> Gustavo Cordeiro Libel - UTFPR - 2017 <<<<<<<<%
%-----------------------------------------------------%

%format long;

delta = 0.05;
max_int =100;

% carrega func, n, w, x e d
dados2;

w_inicio = w;

passo = 1.0;

for i = 1:max_int
  
  %erros
  r = erro(func,w,x,d);
  er = sum((r.*r)/2);
  er_med = er/size(x)(1);

  %jacobiana para todo r
  jacob = erro(func,w,x,d,true);
  
  %aproximacao da hessiana
  hessiana = jacob'*jacob;
  gradiente = jacob'*r;
  
  %direcao = -inv(hessiana)*gradiente;
  direcao = -hessiana\gradiente;
  %direcao = -gradiente
  
  %sum(abs(r).**2)%|r|^2
  %er             %f(x)
  %norm(direcao)  %|p_i^GN|
  
  %passo = armijo(func,w,x,d,er,gradiente,direcao);
  
  %atualizacao
  w =w+ passo*direcao;
  
  %escape
  if norm(direcao) < delta
    break;
  end

  %print
  printf('%d/%d interacoes, erro: %f\n',i,max_int,er);
  fflush(stdout);

end

%print
printf('%d/%d interacoes, erro: %f\n',i,max_int,er);
printf('----------------------------------\n');
if (strcmp(func,'func'))
  printf('y = %f*exp(%f*t)\n',w(1),w(2))
elseif(strcmp(func,'func2'))
  printf('y = %f*sin(%f*t+%f)+%f\n',w(1),w(2),w(3),w(4))
end
%=======================================
%=====graficos
clf;

%dados
xs = min(x):0.1:max(x);
ys = feval(func,w,xs);
ys2 = feval(func,w_inicio,xs);

%grafico 1 - Inicio
plot(xs,ys2,'linewidth',2.0);
hold on
plot(x, d, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor','k', 
     'LineWidth', 2, 'MarkerSize', 6)%pontos
hold off

%grafico 2 - Final
figure(2)
plot(xs,ys,'linewidth',2.0);
hold on
plot(x, d, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor','k', 
     'LineWidth', 2, 'MarkerSize', 6)%pontos
hold off

