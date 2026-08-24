clc
clear
close all

func = @(M, DP) (DP * randn(100000, 1)) + M; % Reduzido para 100k para agilizar
A = func(10, 2);

num_int = 20;
valor_min = min(A);
valor_max = max(A);

% Cria os limites das classes (edges)
limites = linewidth = linspace(valor_min, valor_max, num_int + 1);

% 3. Contar as frequências manualmente
frequencias = zeros(1, num_int);

for i = 1:num_int
    if i == num_int
        % O último intervalo inclui o valor máximo (<=)
        frequencias(i) = sum(A >= limites(i) & A <= limites(i+1));
    else
        % Intervalos normais [limite_inferior, limite_superior)
        frequencias(i) = sum(A >= limites(i) & A < limites(i+1));
    end
end

centros = (limites(1:end-1) + limites(2:end)) / 2;

% 5. Plotar o histograma usando a função de barras
figure;
bar(centros, frequencias, 1, 'FaceColor', [0.2 0.6 0.8], 'EdgeColor', 'k');


