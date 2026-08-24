clc               % Limpa a janela de comandos do Octave
clear             % Apaga todas as variáveis salvas na memória
close all         % Fecha todas as janelas de gráficos abertas

tempo_total = 3;
t_amos = 0.01;

t = 0 : t_amos : tempo_total;

N = length(t);

h = 2 * exp(t.*-4);

u = ones(1, N); % Cria o vetor 'u' dinamicamente com o mesmo tamanho de 't'

y = zeros(1, N);

h_inv = zeros(1, N);

for i = 1: N
  h_inv(i) = h(N - i + 1);
end

for n = 1:N
    soma = 0;
    for k = 1:n
        % h_deslocado acessa h(n - k + 1) equivalendo a h(t - tau)
        soma = soma + h(n - k + 1) * u(k);
    end
    % Multiplica pelo passo de amostragem (t_amos) para aproximar a integral contínua
    y(n) = soma * t_amos;
end

##plot(t, h, t, u, 'm', t, h_inv, 'g');

plot(t, y);

