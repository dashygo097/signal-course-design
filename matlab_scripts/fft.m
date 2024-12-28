for i = 1:9
    % 构建文件路径
    filename = fullfile('../data/original_data', sprintf('%d.mat', i));
    
    % 加载 .mat 文件
    data = load(filename);
    
    % 获取文件中的变量名，假设文件中只有一个变量
    varName = fieldnames(data);
    
    % 将数据赋值给对应的变量名
    assignin('base', sprintf('noise%d', i), data.(varName{1}));
end

Fs = 40000000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 4000001;
t = (0:L-1)*T;
Y = fft(noise1);
P2 = abs(Y/L);
P1 = P2(1:(L-1)/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% 创建一个新图形窗口，包含2个子图
figure;

% Top plot
subplot(2, 1, 1); % 2行1列的第1个子图
plot(noise1)
xlim([0 4000000])
title('noise 1')
xlabel("t")
ylabel("signal")

% Bottom plot
subplot(2, 1, 2); % 2行1列的第2个子图
plot(Fs/(L-1)*(0:((L-1)/2)), P1)
ylim([0 0.8])
title('dealt')
xlabel("Hz")
ylabel("power")

% 将图像保存为文件
saveas(gcf, '../diagrams/fft_mag_distributed');

% 保存P1（dealt图中的数据）到.mat文件
dealt_data = P1;  % 将P1数据保存为dealt_data
save('../data/fft_mag', '$PROCESSED_DATA');
