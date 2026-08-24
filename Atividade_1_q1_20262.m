clc               % Limpa a janela de comandos do Octave
clear             % Apaga todas as variáveis salvas na memória
close all         % Fecha todas as janelas de gráficos abertas

x = linspace(-3, 3, 100); % Cria um vetor de 100 pontos igualmente espaçados entre -3 e 3
y = linspace(-3, 3, 100); % Cria um vetor de 100 pontos igualmente espaçados entre -3 e 3

[X, Y] = meshgrid(x, y);  % Gera duas matrizes 2D (100x100) combinando todas as coordenadas de X e Y

sigma_x = 1;
sigma_y = 1;
A = 1;
x0 = 0;      % Coordenada X do centro (pico) da função
y0 = 0;      % Coordenada Y do centro (pico) da função


f = @(x, y, A, x0, y0, sigma_x, sigma_y) A * exp( - ( ((x - x0).^2 / (2 * sigma_x^2)) + ((y - y0).^2 / (2 * sigma_y^2)) ) );
             % Declara a função anônima da Gaussiana 2D usando operadores elemento a elemento (.^ e /)

Z = f(X, Y, A, x0, y0, sigma_x, sigma_y);
             % Avalia a função 'f' para a grade inteira e armazena os resultados na matriz Z (100x100)

% 4. Renderização do gráfico
surf(X, Y, Z); % Plota a superfície em 3D (surf) combinada com as curvas de nível (contour) projetadas na base

##plot3(X, Y, Z);

##mesh(X, Y, Z);

